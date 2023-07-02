import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/model/vo/statistic/statistic_vo.dart';
import 'package:youdeyiwu_app/service/security_service.dart';
import 'package:youdeyiwu_app/user/widget/menuItem.dart';
import 'package:youdeyiwu_app/user/widget/related_posts.dart';
import 'package:youdeyiwu_app/user/widget/statistic.dart';
import 'package:youdeyiwu_app/userid/widget/related_posts.dart' as user_id;

Widget buildMenuGroup2({
  required BuildContext context,
  bool? isUserId,
  StatisticVo? statistics,
  String? id,
}) {
  var loggedIn = SecurityService.isUserLoggedIn(context: context);

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
            AppLocalizations.of(context)!.relatedPosts,
          ),
          onTap: () {
            if (isUserId == true) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => user_id.RelatedPosts(
                        id: id!,
                        isClickPost: true,
                      )));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RelatedPosts(
                        isClickPost: true,
                      )));
            }
          },
        ),
        if (loggedIn == true && isUserId != true)
          buildMenuItem(
            context: context,
            leftIcon: BootstrapIcons.stars,
            rightIcon: BootstrapIcons.chevron_right,
            title: Text(
              AppLocalizations.of(context)!.viewFavorites,
            ),
            onTap: () {},
          ),
        buildMenuItem(
          context: context,
          leftIcon: BootstrapIcons.signpost,
          rightIcon: BootstrapIcons.chevron_right,
          title: Text(
            AppLocalizations.of(context)!.relatedContent,
          ),
          onTap: () {
            if (isUserId == true) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => user_id.RelatedPosts(
                        id: id!,
                        isClickContent: true,
                      )));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RelatedPosts(
                        isClickContent: true,
                      )));
            }
          },
        ),
        buildMenuItem(
          context: context,
          leftIcon: BootstrapIcons.signpost,
          rightIcon: BootstrapIcons.chevron_right,
          title: Text(
            AppLocalizations.of(context)!.relatedTags,
          ),
          onTap: () {
            if (isUserId == true) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => user_id.RelatedPosts(
                        id: id!,
                        isClickTag: true,
                      )));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RelatedPosts(
                        isClickTag: true,
                      )));
            }
          },
        ),
        buildMenuItem(
          context: context,
          leftIcon: BootstrapIcons.signpost,
          rightIcon: BootstrapIcons.chevron_right,
          title: Text(
            AppLocalizations.of(context)!.relatedStatistics,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Statistic(
                      statistics: statistics,
                    )));
          },
        ),
      ],
    ),
  );
}
