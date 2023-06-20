import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/home/bloc/home_bloc.dart';
import 'package:youdeyiwu_app/home/bloc/home_controller.dart';
import 'package:youdeyiwu_app/home/bloc/home_state.dart';
import 'package:youdeyiwu_app/home/widget/all_content.dart';
import 'package:youdeyiwu_app/home/widget/all_post.dart';
import 'package:youdeyiwu_app/home/widget/all_tag.dart';
import 'package:youdeyiwu_app/home/widget/related_content.dart';
import 'package:youdeyiwu_app/home/widget/search_bar.dart';
import 'package:youdeyiwu_app/home/widget/username.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';

/// Home
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

/// _HomeState
class _HomeState extends State<Home> {
  late ScrollController _scrollController;
  late HomeController _homeController;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _homeController = HomeController(context: context)..init();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  /// _scrollListener
  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _homeController.LoadMorePostData(name: searchController.text);
    }
  }

  /// _refresh
  Future<void> _refresh() async {
    await _homeController.updatePostData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      var sections = state.sections;
      var sectionGroups = sections
          .where((element) => element.sectionGroup != null)
          .map((e) => e.sectionGroup!)
          .toSet()
          .toList()
        ..sort((a, b) => a.sort - b.sort);

      var currentSelectedSectionGroup = state.currentSelectedSectionGroup;
      if (currentSelectedSectionGroup != null) {
        sections = sections
            .where((element) =>
                element.sectionGroup != null &&
                element.sectionGroup!.id == currentSelectedSectionGroup.id)
            .toList();
      }

      var currentSelectedSection = state.currentSelectedSection;
      List<TagVo> tags =
          currentSelectedSection != null ? currentSelectedSection.tags : [];

      return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.w),
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              controller: _scrollController,
              children: [
                buildUsername(context: context),
                SizedBox(
                  height: 16.h,
                ),
                buildSearchBar(
                  context: context,
                  searchController: searchController,
                ),
                SizedBox(
                  height: 16.h,
                ),
                if (sectionGroups.isNotEmpty)
                  buildRelatedContent(
                    context: context,
                    sectionGroups: sectionGroups,
                  ),
                if (sectionGroups.isNotEmpty)
                  SizedBox(
                    height: 16.h,
                  ),
                buildAllContent(context: context, sections: sections),
                if (tags.isNotEmpty) buildAllTag(context: context, tags: tags),
                SizedBox(
                  height: 16.h,
                ),
                buildAllPost(
                  context: context,
                  postData: state.postData,
                  isLoading: state.isLoading,
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ));
    });
  }
}
