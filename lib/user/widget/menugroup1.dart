import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';
import 'package:youdeyiwu_app/service/security_service.dart';
import 'package:youdeyiwu_app/user/widget/menuItem.dart';

Widget buildMenuGroup1({required BuildContext context, bool? isUserId}) {
  var loggedIn = SecurityService.isUserLoggedIn(context: context);
  List<Widget> children = [];

  if (loggedIn == true && isUserId != true) {
    if (isUserId == null || isUserId == false) {
      children.add(buildMenuItem(
        context: context,
        leftIcon: BootstrapIcons.plus_lg,
        rightIcon: BootstrapIcons.chevron_right,
        title: Text(
          AppLocalizations.of(context)!.createPost,
        ),
        onTap: () {},
      ));
    }
  } else {
    children.addAll([
      buildMenuItem(
        context: context,
        leftIcon: BootstrapIcons.person,
        rightIcon: BootstrapIcons.chevron_right,
        title: Text(
          AppLocalizations.of(context)!.loginStartText,
        ),
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.login);
        },
      ),
      buildMenuItem(
        context: context,
        leftIcon: BootstrapIcons.person_add,
        rightIcon: BootstrapIcons.chevron_right,
        title: Text(
          AppLocalizations.of(context)!.registerStartText,
        ),
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.register);
        },
      ),
    ]);
  }

  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColorsLight.borderColor),
      borderRadius: BorderRadius.circular(8.w),
    ),
    child: Column(
      children: children,
    ),
  );
}
