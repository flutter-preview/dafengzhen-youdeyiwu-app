import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildMenuItem({
  required BuildContext context,
  required IconData leftIcon,
  required Widget title,
  required IconData rightIcon,
  required VoidCallback? onTap,
}) {
  return ListTile(
    leading: Icon(
      leftIcon,
      size: 18.w,
    ),
    trailing: Icon(
      rightIcon,
      size: 18.w,
    ),
    title: title,
    onTap: onTap,
    contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
    visualDensity: VisualDensity.comfortable,
  );
}
