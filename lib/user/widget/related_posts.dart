import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/common/app_colors_light.dart';
import 'package:youdeyiwu_app/constants/app_routes.dart';
import 'package:youdeyiwu_app/tool/tool.dart';
import 'package:youdeyiwu_app/user/bloc/user_bloc.dart';
import 'package:youdeyiwu_app/user/bloc/user_controller.dart';
import 'package:youdeyiwu_app/user/bloc/user_event.dart';
import 'package:youdeyiwu_app/user/bloc/user_state.dart';

/// RelatedPosts
class RelatedPosts extends StatefulWidget {
  final bool? isClickContent;
  final bool? isClickTag;
  final bool? isClickPost;

  const RelatedPosts({
    super.key,
    this.isClickContent,
    this.isClickTag,
    this.isClickPost,
  });

  @override
  State<RelatedPosts> createState() => _RelatedPostsState();
}

class _RelatedPostsState extends State<RelatedPosts> {
  late ScrollController _scrollController;
  late UserController _userController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _userController = UserController(context: context);
    _userController.init();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  /// _scrollListener
  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _userController.LoadMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      List<Widget> children = [];
      var isClickContent = widget.isClickContent;
      var isClickTag = widget.isClickTag;
      var isClickPost = widget.isClickPost;
      var currentSection = state.currentSection;
      var currentTag = state.currentTag;

      if (isClickContent == true || isClickPost == true) {
        var sections = state.details?.sections ?? [];
        List<Widget> sectionWidgets = [];

        for (var element in sections) {
          sectionWidgets.add(
            InkWell(
              onTap: () {
                if (currentSection != null && currentSection.id == element.id) {
                  context
                      .read<UserBloc>()
                      .add(const UpdateCurrentSectionUserEvent(
                        currentSection: null,
                      ));
                  _userController.loadPostData();
                } else {
                  context.read<UserBloc>().add(UpdateCurrentSectionUserEvent(
                        currentSection: element,
                      ));
                  _userController.loadPostData(sectionVo: element);
                }

                if (isClickContent == true) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RelatedPosts(
                            isClickContent: true,
                            isClickPost: true,
                          )));
                }
              },
              borderRadius: BorderRadius.circular(32.w),
              child: Container(
                decoration: BoxDecoration(
                  color: currentSection?.id == element.id
                      ? AppColorsLight.primaryBorderSubtle
                      : AppColorsLight.backgroundColor,
                  borderRadius: BorderRadius.circular(32.w),
                  backgroundBlendMode: BlendMode.multiply,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                child: Text(element.name),
              ),
            ),
          );
        }

        if (sectionWidgets.isEmpty) {
          sectionWidgets.add(buildNoMoreDataWidget(context: context));
        }

        children.add(
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.relatedContent,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Wrap(
                  spacing: 16.w,
                  runSpacing: 16.h,
                  children: sectionWidgets,
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        );
      }

      if (isClickTag == true || isClickPost == true) {
        var tags = state.details?.tags ?? [];
        List<Widget> tagWidgets = [];

        for (var element in tags) {
          tagWidgets.add(
            InkWell(
              onTap: () {
                if (currentTag != null && currentTag.id == element.id) {
                  context.read<UserBloc>().add(const UpdateCurrentTagUserEvent(
                        currentTag: null,
                      ));
                  _userController.loadPostData();
                } else {
                  context.read<UserBloc>().add(UpdateCurrentTagUserEvent(
                        currentTag: element,
                      ));
                  _userController.loadPostData(tagVo: element);
                }

                if (isClickTag == true) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RelatedPosts(
                            isClickTag: true,
                            isClickPost: true,
                          )));
                }
              },
              borderRadius: BorderRadius.circular(32.w),
              child: Container(
                decoration: BoxDecoration(
                  color: currentTag?.id == element.id
                      ? AppColorsLight.primaryBorderSubtle
                      : AppColorsLight.backgroundColor,
                  borderRadius: BorderRadius.circular(32.w),
                  backgroundBlendMode: BlendMode.multiply,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                child: Text(element.name),
              ),
            ),
          );
        }

        if (tagWidgets.isEmpty) {
          tagWidgets.add(buildNoMoreDataWidget(context: context));
        }

        children.add(
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.relatedTags,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Wrap(
                  spacing: 16.w,
                  runSpacing: 16.h,
                  children: tagWidgets,
                ),
                SizedBox(
                  height: 16.h,
                ),
                if (isClickTag != true)
                  Divider(
                    height: 24.h,
                    color: AppColorsLight.borderColor,
                  ),
              ],
            ),
          ),
        );
      }

      if (isClickPost == true) {
        var posts = state.details?.data.content ?? [];
        List<Widget> postWidgets = [];

        for (var element in posts) {
          List<Widget> itemChildren = [
            Text(
              textAlign: TextAlign.center,
              element.name,
            ),
            SizedBox(
              height: 16.h,
            ),
          ];
          var overview = element.overview;

          if (overview != null && overview.isNotEmpty) {
            itemChildren.add(
              Text(
                overview,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            );
            itemChildren.add(
              SizedBox(
                height: 16.h,
              ),
            );
          }

          itemChildren.addAll([
            ElevatedButton(
              onPressed: () {
                var id = element.id;
                Navigator.of(context).pushNamed("${AppRoutes.postId}/$id",
                    arguments: {"id": id});
              },
              child: Text(AppLocalizations.of(context)!.readMore),
            ),
            SizedBox(
              height: 8.h,
            ),
            const Divider(
              color: AppColorsLight.borderColor,
            ),
          ]);

          postWidgets.add(
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Column(
                children: itemChildren,
              ),
            ),
          );
        }

        children.addAll(postWidgets);
        children.add(
          buildBottomNoMoreDataWidget(),
        );
      }

      return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: ListView(
            controller: _scrollController,
            children: children,
          ),
        ),
      ));
    });
  }
}
