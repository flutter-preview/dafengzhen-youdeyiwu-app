import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:youdeyiwu_app/api/captcha_api.dart';
import 'package:youdeyiwu_app/api/key_api.dart';
import 'package:youdeyiwu_app/api/path_api.dart';
import 'package:youdeyiwu_app/api/register_api.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';
import 'package:youdeyiwu_app/enums/snack_bar_enum.dart';
import 'package:youdeyiwu_app/model/dto/username_register_dto.dart';
import 'package:youdeyiwu_app/register/bloc/register_bloc.dart';
import 'package:youdeyiwu_app/register/bloc/register_event.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_event.dart';
import 'package:youdeyiwu_app/service/global/global_service.dart';
import 'package:youdeyiwu_app/tool/api_client.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// RegisterController
class RegisterController {
  final BuildContext context;

  RegisterController({required this.context});

  Future<void> init() async {
    var apiClient = ApiClient();
    try {
      var vo = await PathApi.query(apiClient: apiClient, name: "/register");
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
    context.read<RegisterBloc>().add(VerificationCodeIdEvent(id));
  }

  Future<void> handleUsernameRegister() async {
    final state = context.read<RegisterBloc>().state;
    var userAgreed = state.userAgreed;
    var username = state.username;
    var password = state.password;
    var verificationCodeId = state.verificationCodeId;
    var verificationCode = state.verificationCode;

    if (userAgreed == false) {
      showSnackBar(
        context: context,
        e: AppLocalizations.of(context)!.termsAndConditions,
      );
      return;
    }

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

      var body = UsernameRegisterDto(
        username: username,
        password: newPassword,
        cid: verificationCodeId,
        code: verificationCode,
      );
      var vo =
          await RegisterApi.usernameRegister(apiClient: apiClient, body: body);
      await GlobalService.storageService.setTokenVo(vo);

      showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.registrationSuccess,
          type: SnackBarTypeEnum.success,
          duration: Duration(milliseconds: 1000));

      showSnackBar(
          context: context,
          e: AppLocalizations.of(context)!.reloadingSoon,
          type: SnackBarTypeEnum.primary,
          duration: Duration(milliseconds: 1200));

      await Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.root,
          (route) => false,
        );
      });
    } catch (e, stackTrace) {
      showSnackBar(context: context, e: e, stackTrace: stackTrace);
      Navigator.of(context).pop();
    } finally {
      apiClient.close();
    }
  }
}
