import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/user/bloc/user_controller.dart';
import 'package:youdeyiwu_app/user/widget/menuItem.dart';

Widget buildMenuGroup5({
  required BuildContext context,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColorsLight.borderColor),
      borderRadius: BorderRadius.circular(8.w),
    ),
    child: Column(
      children: [
        buildMenuItem(
          context: context,
          leftIcon: BootstrapIcons.arrow_bar_right,
          rightIcon: BootstrapIcons.chevron_right,
          title: Text(
            AppLocalizations.of(context)!.logout,
          ),
          onTap: () {
            UserController(context: context).logout();
          },
        ),
      ],
    ),
  );
}
