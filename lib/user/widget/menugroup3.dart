import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';
import 'package:youdeyiwu_app/model/vo/user/contact_vo.dart';
import 'package:youdeyiwu_app/user/widget/about_me.dart';
import 'package:youdeyiwu_app/user/widget/contact.dart';
import 'package:youdeyiwu_app/user/widget/menuItem.dart';

Widget buildMenuGroup3({
  required BuildContext context,
  String? about,
  List<ContactVo>? contacts,
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
          leftIcon: BootstrapIcons.signpost,
          rightIcon: BootstrapIcons.chevron_right,
          title: Text(
            AppLocalizations.of(context)!.aboutMe,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AboutMe(
                      about: about,
                    )));
          },
        ),
        buildMenuItem(
          context: context,
          leftIcon: BootstrapIcons.person_lines_fill,
          rightIcon: BootstrapIcons.chevron_right,
          title: Text(
            AppLocalizations.of(context)!.contactInformation,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Contact(
                      contacts: contacts ?? [],
                    )));
          },
        ),
        buildMenuItem(
          context: context,
          leftIcon: BootstrapIcons.signpost,
          rightIcon: BootstrapIcons.chevron_right,
          title: Text(
            AppLocalizations.of(context)!.privacyPolicyText,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.privacy);
          },
        ),
        buildMenuItem(
          context: context,
          leftIcon: BootstrapIcons.signpost,
          rightIcon: BootstrapIcons.chevron_right,
          title: Text(
            AppLocalizations.of(context)!.termsOfService,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.terms);
          },
        ),
      ],
    ),
  );
}
