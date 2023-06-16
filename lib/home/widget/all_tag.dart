import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/home/bloc/home_bloc.dart';
import 'package:youdeyiwu_app/home/bloc/home_controller.dart';
import 'package:youdeyiwu_app/home/bloc/home_event.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';

Widget buildAllTag({
  required BuildContext context,
  List<TagVo> tags = const [],
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 8.h,
      ),
      Container(
        height: 36.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, index) {
            TagVo tag = tags[index];
            List<Widget> columnChildren = [];
            var currentSelectedSection =
                context.read<HomeBloc>().state.currentSelectedSection;
            var currentSelectedTag =
                context.read<HomeBloc>().state.currentSelectedTag;

            bool isSameTag =
                currentSelectedTag != null && currentSelectedTag.id == tag.id;

            columnChildren.add(
              Text(
                tag.name,
                overflow: TextOverflow.ellipsis,
              ),
            );

            return InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: isSameTag == true
                      ? AppColorsLight.primaryBackgroundSubtle
                      : AppColorsLight.tertiaryBackgroundColor,
                  borderRadius: BorderRadius.circular(36.w),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Center(
                    child: Text(
                      tag.name,
                    ),
                  ),
                ),
              ),
              onTap: () {
                if (isSameTag) {
                  context
                      .read<HomeBloc>()
                      .add(const UpdateCurrentSelectedTagHomeEvent(null));

                  if (currentSelectedSection != null) {
                    HomeController(context: context)
                        .updatePostDataBySectionIdOrTagId(
                            sectionId: currentSelectedSection.id);
                  }
                } else {
                  context
                      .read<HomeBloc>()
                      .add(UpdateCurrentSelectedTagHomeEvent(tag));

                  if (currentSelectedSection != null) {
                    HomeController(context: context)
                        .updatePostDataBySectionIdOrTagId(
                            sectionId: currentSelectedSection.id,
                            tagId: tag.id);
                  }
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
    ],
  );
}
