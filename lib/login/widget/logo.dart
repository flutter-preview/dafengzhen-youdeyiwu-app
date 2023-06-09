import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// logo
Widget logo() {
  return Padding(
    padding: EdgeInsets.only(top: 40.h),
    child: Center(
      child: SvgPicture.asset(
        "assets/images/logo.svg",
        semanticsLabel: 'logo',
        width: 48.w,
        height: 48.h,
      ),
    ),
  );
}
