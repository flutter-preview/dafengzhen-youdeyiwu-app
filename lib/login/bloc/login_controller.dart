import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:youdeyiwu_app/api/captcha_api.dart';
import 'package:youdeyiwu_app/api/key_api.dart';
import 'package:youdeyiwu_app/api/login_api.dart';
import 'package:youdeyiwu_app/api/path_api.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';
import 'package:youdeyiwu_app/enums/snack_bar_enum.dart';
import 'package:youdeyiwu_app/login/bloc/login_bloc.dart';
import 'package:youdeyiwu_app/login/bloc/login_event.dart';
import 'package:youdeyiwu_app/model/dto/username_login_dto.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_event.dart';
import 'package:youdeyiwu_app/service/global/global_service.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// LoginController
class LoginController {
  final BuildContext context;

  LoginController({required this.context});

  Future<void> init() async {
    var apiClient = ApiClient();
    try {
      var vo = await PathApi.query(apiClient: apiClient, name: "/login");
      context.read<GlobalBloc>().add(PathGlobalEvent(vo));
      if (vo.imageConfig?.enable == true) {
        await refreshCaptchaImage(apiClient: apiClient);
      }
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
    }
  }

  Future<void> refreshCaptchaImage({ApiClient? apiClient}) async {
    var id = await CaptchaApi.generateImageId(apiClient: apiClient);
    context.read<LoginBloc>().add(VerificationCodeIdEvent(id));
  }

  Future<void> handleUsernameLogin() async {
    final state = context.read<LoginBloc>().state;
    var username = state.username;
    var password = state.password;
    var verificationCodeId = state.verificationCodeId;
    var verificationCode = state.verificationCode;

    if (username.length < 3 || username.length > 16) {
      showSnackBar(
        context: context,
        e: AppLocalizations.of(context)!.accountLengthRange,
      );
      return;
    }

    if (password.length < 6 || password.length > 19) {
      showSnackBar(
        context: context,
        e: AppLocalizations.of(context)!.passwordLengthRange,
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    var apiClient = ApiClient();
    try {
      var publicKey = getPublicKey(
          await KeyApi.queryPasswordPublicKey(apiClient: apiClient));
      final newPassword = Encrypter(
              RSA(publicKey: RSAKeyParser().parse(publicKey) as RSAPublicKey))
          .encrypt(password)
          .base64;

      var body = UsernameLoginDto(
        username: username,
        password: newPassword,
        cid: verificationCodeId,
        code: verificationCode,
      );
      var vo = await LoginApi.usernameLogin(apiClient: apiClient, body: body);
      await GlobalService.storageService.setTokenVo(vo);

      showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.loginSuccess,
          type: SnackBarTypeEnum.success,
          duration: Duration(milliseconds: 1000));

      showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.reloadingSoon,
          type: SnackBarTypeEnum.primary,
          duration: Duration(milliseconds: 1500));

      await Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.root,
          (route) => false,
        );
      });
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
    } finally {
      apiClient.close();
      Navigator.of(context).pop();
    }
  }
}
