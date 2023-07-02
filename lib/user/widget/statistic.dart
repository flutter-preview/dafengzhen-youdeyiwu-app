import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/model/vo/statistic/statistic_vo.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// Statistic
class Statistic extends StatefulWidget {
  final StatisticVo? statistics;

  const Statistic({super.key, this.statistics});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  @override
  Widget build(BuildContext context) {
    var statistics = widget.statistics;

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: (statistics == null)
            ? buildNoMoreDataWidget(context: context)
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: AppColorsLight.tertiaryBackgroundColor,
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(BootstrapIcons.bar_chart),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                    "${AppLocalizations.of(context)!.contentCount} ${formatCount(statistics.sections)}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: AppColorsLight.tertiaryBackgroundColor,
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(BootstrapIcons.bar_chart),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                    "${AppLocalizations.of(context)!.tagCount} ${formatCount(statistics.tags)}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: AppColorsLight.tertiaryBackgroundColor,
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(BootstrapIcons.bar_chart),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                    "${AppLocalizations.of(context)!.postCount} ${formatCount(statistics.posts)}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: AppColorsLight.tertiaryBackgroundColor,
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(BootstrapIcons.bar_chart),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                    "${AppLocalizations.of(context)!.commentCount} ${formatCount(statistics.comments)}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: AppColorsLight.tertiaryBackgroundColor,
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(BootstrapIcons.bar_chart),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                    "${AppLocalizations.of(context)!.replyCount} ${formatCount(statistics.replies)}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: AppColorsLight.tertiaryBackgroundColor,
                              borderRadius: BorderRadius.circular(10.w),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(BootstrapIcons.bar_chart),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                    "${AppLocalizations.of(context)!.viewCount} ${formatCount(statistics.views)}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
