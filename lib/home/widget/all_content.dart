import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/home/bloc/home_bloc.dart';
import 'package:youdeyiwu_app/home/bloc/home_controller.dart';
import 'package:youdeyiwu_app/home/bloc/home_event.dart';
import 'package:youdeyiwu_app/model/vo/section/section_client_vo.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

Widget buildAllContent({
  required BuildContext context,
  List<SectionClientVo> sections = const [],
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.allContent,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextButton(
            onPressed: () {},
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
                Icon(
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
      if (sections.isNotEmpty)
        Container(
          height: 105.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: sections.length,
            itemBuilder: (context, index) {
              SectionClientVo section = sections[index];
              bool hasCover = section.cover != null;
              List<Widget> columnChildren = [];
              var currentSelectedSection =
                  context.read<HomeBloc>().state.currentSelectedSection;

              bool isSameSection = currentSelectedSection != null &&
                  currentSelectedSection.id == section.id;

              if (hasCover) {
                columnChildren.add(
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.w),
                      child: Image.network(getCover(section.cover!)),
                    ),
                  ),
                );
                columnChildren.add(
                  SizedBox(
                    height: 6.h,
                  ),
                );
              }

              columnChildren.add(
                Text(
                  section.name,
                  overflow: TextOverflow.ellipsis,
                ),
              );

              return InkWell(
                child: Container(
                  width: 140.w,
                  height: 105.h,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: isSameSection
                        ? AppColorsLight.secondaryBackgroundColor
                        : AppColorsLight.tertiaryBackgroundColor,
                    borderRadius: BorderRadius.circular(6.w),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: hasCover
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: columnChildren,
                  ),
                ),
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(const UpdateCurrentSelectedTagHomeEvent(null));

                  if (isSameSection) {
                    context
                        .read<HomeBloc>()
                        .add(const UpdateCurrentSelectedSectionHomeEvent(null));
                    HomeController(context: context).updatePostData();
                  } else {
                    context
                        .read<HomeBloc>()
                        .add(UpdateCurrentSelectedSectionHomeEvent(section));
                    HomeController(context: context)
                        .updatePostDataBySectionIdOrTagId(
                            sectionId: section.id);
                  }
                  context
                      .read<HomeBloc>()
                      .add(const UpdateIsLoadingHomeEvent(true));
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 16.w),
          ),
        ),
      if (sections.isEmpty)
        Container(
          child: buildNoMoreDataWidget(context: context, nodata: true),
        )
    ],
  );
}
