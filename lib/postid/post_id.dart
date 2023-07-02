import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_bloc.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_controller.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_state.dart';
import 'package:youdeyiwu_app/postid/widget/post_button.dart';
import 'package:youdeyiwu_app/postid/widget/post_comment.dart';
import 'package:youdeyiwu_app/postid/widget/post_content.dart';
import 'package:youdeyiwu_app/postid/widget/post_name.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// PostId
class PostId extends StatefulWidget {
  const PostId({Key? key}) : super(key: key);

  @override
  State<PostId> createState() => _PostIdState();
}

/// _PostIdState
class _PostIdState extends State<PostId> {
  late ScrollController _scrollController;
  late PostIdController _postIdController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is Map<String, dynamic> && arguments['id'] != null) {
      var id = arguments['id'].toString();
      _postIdController = PostIdController(context: context)..init(id: id);
    }
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
      _postIdController.LoadMoreData();
    }
  }

  /// _refresh
  Future<void> _refresh() async {
    await _postIdController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostIdBloc, PostIdState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: Stack(
              children: [
                ListView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: state.details == null
                      ? [buildLoadingIndicator()]
                      : [
                          buildPostName(
                            context: context,
                            name: state.details!.basic.name,
                            time: state.details!.basic.contentUpdatedOn,
                            user: state.details!.user,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          buildPostContent(
                            context: context,
                            content: state.details!.content,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          if (state.details!.data.content.isNotEmpty)
                            buildPostButton(
                              context: context,
                              basic: state.details!.basic,
                              details: state.details!.details,
                              alias: state.details!.user.alias,
                              isLike: state.details!.isLike,
                              isFollow: state.details!.isFollow,
                              isFavourite: state.details!.isFavourite,
                            ),
                          SizedBox(
                            height: 32.h,
                          ),
                          buildPostComment(
                              context: context, data: state.details!.data),
                          SizedBox(
                            height: 16.h,
                          ),
                        ],
                ),
                if (state.details != null &&
                    state.details!.data.content.isEmpty)
                  Positioned(
                    bottom: 20.h,
                    left: 0,
                    right: 0,
                    child: buildPostButton(
                      context: context,
                      basic: state.details!.basic,
                      details: state.details!.details,
                      alias: state.details!.user.alias,
                      isLike: state.details!.isLike,
                      isFollow: state.details!.isFollow,
                      isFavourite: state.details!.isFavourite,
                    ),
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            buildBottomNavigationBar(context: context, isOnTap: true),
      ));
    });
  }
}
