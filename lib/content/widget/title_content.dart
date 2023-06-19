import 'package:flutter/material.dart';
import 'package:youdeyiwu_app/model/vo/section/section_group_vo.dart';

Widget buildTitleContent({
  required BuildContext context,
  required SectionGroupVo sectionGroup,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        sectionGroup.name,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    ],
  );
}
