import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';
import 'package:youdeyiwu_app/model/vo/section/section_client_vo.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

Widget buildAllContent({
  required BuildContext context,
  List<SectionClientVo> sections = const [],
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (sections.isNotEmpty)
        Wrap(
          spacing: 16.w,
          runSpacing: 16.h,
          children: sections.map((section) {
            List<Widget> columnChildren = [];
            bool hasCover = section.cover != null;

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
                  color: AppColorsLight.tertiaryBackgroundColor,
                  borderRadius: BorderRadius.circular(6.w),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: columnChildren,
                ),
              ),
              onTap: () {
                var id = section.id;
                Navigator.of(context).pushNamed("${AppRoutes.contentId}/$id",
                    arguments: {"id": id});
              },
            );
          }).toList(),
        ),
      if (sections.isEmpty)
        Container(
          child: buildNoMoreDataWidget(context: context, nodata: true),
        )
    ],
  );
}
