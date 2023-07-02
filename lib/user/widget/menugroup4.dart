import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/user/widget/menuItem.dart';

Widget buildMenuGroup4({
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
          leftIcon: BootstrapIcons.person_bounding_box,
          rightIcon: BootstrapIcons.chevron_right,
          title: Text(
            AppLocalizations.of(context)!.updateAvatar,
          ),
          onTap: () {},
        ),
        buildMenuItem(
          context: context,
          leftIcon: BootstrapIcons.pencil_square,
          rightIcon: BootstrapIcons.chevron_right,
          title: Text(
            AppLocalizations.of(context)!.updateProfile,
          ),
          onTap: () {},
        ),
        buildMenuItem(
          context: context,
          leftIcon: BootstrapIcons.pencil_square,
          rightIcon: BootstrapIcons.chevron_right,
          title: Text(
            AppLocalizations.of(context)!.updatePassword,
          ),
          onTap: () {},
        ),
      ],
    ),
  );
}
