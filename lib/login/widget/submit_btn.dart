import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/login/bloc/login_controller.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// submitBtn
Widget submitBtn({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required String type,
}) {
  return Padding(
    padding: EdgeInsets.only(top: 32.h),
    child: Center(
      child: ElevatedButton.icon(
        icon: const Icon(Icons.person),
        onPressed: () async {
          if (!formKey.currentState!.validate()) {
            showSnackBar(
              context: context,
              e: AppLocalizations.of(context)!.invalidCredentialsFormat,
            );
            return;
          }

          if (type == "username") {
            await LoginController(context: context).handleUsernameLogin();
          }
        },
        label: Text(
          AppLocalizations.of(context)!.loginNow,
        ),
        style: ButtonStyle(
          textStyle:
              MaterialStatePropertyAll(Theme.of(context).textTheme.titleMedium),
        ),
      ),
    ),
  );
}
