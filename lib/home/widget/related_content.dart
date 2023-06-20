import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/app/bloc/app_bloc.dart';
import 'package:youdeyiwu_app/app/bloc/app_event.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';
import 'package:youdeyiwu_app/home/bloc/home_bloc.dart';
import 'package:youdeyiwu_app/home/bloc/home_event.dart';
import 'package:youdeyiwu_app/model/vo/section/section_group_vo.dart';

Widget buildRelatedContent({
  required BuildContext context,
  List<SectionGroupVo> sectionGroups = const [],
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.relatedContent,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextButton(
            onPressed: () {
              context.read<AppBloc>().add(const TriggerAppEvent(1, 1));
              Navigator.of(context).pushNamed(AppRoutes.content);
            },
            style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.titleMedium,
              ),
            ),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.more,
                ),
                const Icon(
                  Icons.chevron_right,
                ),
              ],
            ),
          )
        ],
      ),
      SizedBox(
        height: 8.h,
      ),
      SizedBox(
        height: 105.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: sectionGroups.length,
          itemBuilder: (context, index) {
            var sectionGroup = sectionGroups[index];
            var currentSelectedSectionGroup =
                context.read<HomeBloc>().state.currentSelectedSectionGroup;

            bool isSameSectionGroup = currentSelectedSectionGroup != null &&
                currentSelectedSectionGroup.id == sectionGroup.id;

            return InkWell(
              child: Container(
                width: 140.w,
                height: 105.h,
                decoration: BoxDecoration(
                  color: isSameSectionGroup
                      ? AppColorsLight.secondaryBackgroundColor
                      : AppColorsLight.tertiaryBackgroundColor,
                  borderRadius: BorderRadius.circular(6.w),
                ),
                padding: EdgeInsets.all(16.w),
                child: Center(
                  child: Text(
                    sectionGroup.name,
                  ),
                ),
              ),
              onTap: () {
                if (isSameSectionGroup) {
                  context.read<HomeBloc>().add(
                      const UpdateCurrentSelectedSectionGroupHomeEvent(null));
                } else {
                  context.read<HomeBloc>().add(
                      UpdateCurrentSelectedSectionGroupHomeEvent(sectionGroup));
                }
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(width: 16.w),
        ),
      ),
    ],
  );
}
