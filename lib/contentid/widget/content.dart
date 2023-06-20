import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/model/vo/section/section_details_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_vo.dart';

/// buildSectionContent
Widget buildSectionContent(
    {required BuildContext context, required SectionDetailsVo details}) {
  var content = details.content;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildSectionName(context: context, name: details.basic.name),
      buildSectionAdmin(context: context, admins: details.admins),
      if (content != null && content.isNotEmpty)
        buildSectionDesc(context: context, content: content),
    ],
  );
}

Widget buildSectionName({required BuildContext context, required String name}) {
  return Text(
    name,
    style: Theme.of(context).textTheme.titleLarge,
  );
}

Widget buildSectionAdmin(
    {required BuildContext context, required List<UserVo> admins}) {
  List<Widget> children = [];

  for (var element in admins) {
    children.add(InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Text(element.alias!),
      ),
    ));
    children.add(SizedBox(
      width: 16.w,
    ));
  }

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: children,
      ),
    ),
  );
}

Widget buildSectionDesc(
    {required BuildContext context, required String content}) {
  return Html(data: content);
}
