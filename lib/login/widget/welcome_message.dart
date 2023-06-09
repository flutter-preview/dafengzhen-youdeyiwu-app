import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// welcomeMessage
Widget welcomeMessage({required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 40.h),
    child: Center(
      child: Text(
        AppLocalizations.of(context)!.loginToYourAccount,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
    ),
  );
}
