import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/contentid/bloc/content_id_bloc.dart';
import 'package:youdeyiwu_app/contentid/bloc/content_id_controller.dart';
import 'package:youdeyiwu_app/contentid/bloc/content_id_event.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';

Widget buildTags({
  required BuildContext context,
  List<TagVo> tags = const [],
}) {
  List<Widget> rows = [];
  List<List<TagVo>> groupedTags = [];
  for (int i = 0; i < tags.length; i += 3) {
    int endIndex = i + 3;
    if (endIndex > tags.length) {
      endIndex = tags.length;
    }
    groupedTags.add(tags.sublist(i, endIndex));
  }

  for (List<TagVo> tagRow in groupedTags) {
    List<Widget> rowChildren = [];

    for (TagVo tag in tagRow) {
      var currentSelectedTag =
          context.read<ContentIdBloc>().state.currentSelectedTag;
      bool isSameTag =
          currentSelectedTag != null && currentSelectedTag.id == tag.id;

      rowChildren.add(
        Expanded(
          child: InkWell(
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: isSameTag == true
                    ? AppColorsLight.primaryBackgroundSubtle
                    : AppColorsLight.tertiaryBackgroundColor,
                borderRadius: BorderRadius.circular(32.w),
              ),
              child: Center(
                child: Text(
                  tag.name,
                ),
              ),
            ),
            onTap: () {
              var id = context.read<ContentIdBloc>().state.details!.basic.id;
              if (isSameTag) {
                context
                    .read<ContentIdBloc>()
                    .add(const UpdateCurrentSelectedTagContentIdEvent(null));

                ContentIdController(context: context)
                    .updateDataBySectionIdOrTagId(sectionId: id);
              } else {
                context
                    .read<ContentIdBloc>()
                    .add(UpdateCurrentSelectedTagContentIdEvent(tag));

                ContentIdController(context: context)
                    .updateDataBySectionIdOrTagId(sectionId: id, tagId: tag.id);
              }
              context
                  .read<ContentIdBloc>()
                  .add(const UpdateIsLoadingContentIdEvent(true));
            },
          ),
        ),
      );
      rowChildren.add(
        SizedBox(
          width: 8.w,
        ),
      );
    }

    rowChildren.removeAt(rowChildren.length - 1);
    rows.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: rowChildren,
      ),
    );
    rows.add(SizedBox(
      height: 8.h,
    ));
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        AppLocalizations.of(context)!.allTag,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      SizedBox(
        height: 8.h,
      ),
      Padding(
        padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
        child: Column(
          children: rows,
        ),
      ),
    ],
  );
}
