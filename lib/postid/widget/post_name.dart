import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

Widget buildPostName({
  required BuildContext context,
  required String name,
  required String time,
  required UserOvVo user,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              user.alias + "  ${toRelativeTime(context: context, time: time)}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
      SizedBox(
        width: 56.w,
        height: 56.h,
        child: CircleAvatar(
          backgroundImage: getUserOvAvatarObject(user: user),
        ),
      )
    ],
  );
}
