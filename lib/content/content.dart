import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/content/bloc/content_bloc.dart';
import 'package:youdeyiwu_app/content/bloc/content_controller.dart';
import 'package:youdeyiwu_app/content/bloc/content_state.dart';
import 'package:youdeyiwu_app/content/widget/all_content.dart';
import 'package:youdeyiwu_app/content/widget/title_content.dart';
import 'package:youdeyiwu_app/model/vo/section/section_client_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_group_vo.dart';

/// Content
class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

/// _ContentState
class _ContentState extends State<Content> {
  late ContentController _contentController;

  @override
  void initState() {
    super.initState();
    _contentController = ContentController(context: context)..init();
  }

  /// _refresh
  Future<void> _refresh() async {
    await _contentController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentBloc, ContentState>(builder: (context, state) {
      Map<SectionGroupVo, List<SectionClientVo>> sectionMap = {};
      for (var element in state.sections) {
        var vo = element.sectionGroup;
        var key = vo ??
            SectionGroupVo(
              id: -1,
              deleted: false,
              name: AppLocalizations.of(context)!.otherContent,
              sort: 1,
            );
        sectionMap.putIfAbsent(key, () => []).add(element);
      }

      List<Widget> sectionWidgets = [];
      List<SectionGroupVo> sortedSectionGroups = sectionMap.keys.toList()
        ..sort((a, b) => a.sort - b.sort);
      var length = sortedSectionGroups.length;

      for (var key in sortedSectionGroups) {
        if (length > 1) {
          sectionWidgets
              .add(buildTitleContent(context: context, sectionGroup: key));
          sectionWidgets.add(SizedBox(
            height: 8.h,
          ));
        }

        var value = sectionMap[key]!;
        sectionWidgets.add(buildAllContent(context: context, sections: value));
        sectionWidgets.add(SizedBox(
          height: 16.h,
        ));
      }

      return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              children: sectionWidgets,
            ),
          ),
        ),
      ));
    });
  }
}
