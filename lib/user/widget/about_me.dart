import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// AboutMe
class AboutMe extends StatefulWidget {
  final String? about;

  const AboutMe({super.key, this.about});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    var about = widget.about;

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: (about == null || about.isEmpty)
            ? buildNoMoreDataWidget(context: context)
            : SingleChildScrollView(child: Html(data: about)),
      ),
    ));
  }
}
