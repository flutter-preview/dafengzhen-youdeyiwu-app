import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';

/// LoginDialog
class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.warmReminder),
      content: Text(AppLocalizations.of(context)!.loginRequiredMessage),
      actions: [
        TextButton(
          child: Text(AppLocalizations.of(context)!.cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(AppLocalizations.of(context)!.login),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(AppRoutes.login);
          },
        ),
      ],
    );
  }
}
