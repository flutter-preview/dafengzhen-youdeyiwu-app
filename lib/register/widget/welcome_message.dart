import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// welcomeMessage
Widget welcomeMessage({required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.only(left: 16.w, bottom: 40.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!
              .welcomeMessage(dotenv.get('APP_NAME', fallback: "尤得一物")),
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          AppLocalizations.of(context)!.inputPrompt,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    ),
  );
}
