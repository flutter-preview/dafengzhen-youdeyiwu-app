import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youdeyiwu_app/dialog/login_dialog.dart';
import 'package:youdeyiwu_app/exception/custom_exception.dart';
import 'package:youdeyiwu_app/service/global/bloc/global_bloc.dart';

/// SecurityService
class SecurityService {
  static bool isUserLoggedIn({required BuildContext context}) {
    var path = context.read<GlobalBloc>().state.path;
    return path != null && path.user != null;
  }

  static void checkUserLogin({required BuildContext context}) {
    if (!isUserLoggedIn(context: context)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const LoginDialog();
        },
      );
      throw CustomException(
          status: 400, message: AppLocalizations.of(context)!.notLoggedIn);
    }
  }
}
