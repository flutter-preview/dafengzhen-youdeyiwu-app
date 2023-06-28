import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/model/vo/comment/post_comment_vo.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_bloc.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_controller.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_state.dart';
import 'package:youdeyiwu_app/postid/widget/post_reply.dart';
import 'package:youdeyiwu_app/postid/widget/post_reply_float_container.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// PostReplyView
class PostReplyView extends StatefulWidget {
  final PostCommentVo element;

  const PostReplyView({
    Key? key,
    required this.element,
  }) : super(key: key);

  @override
  State<PostReplyView> createState() => _PostReplyViewState();
}

class _PostReplyViewState extends State<PostReplyView> {
  late ScrollController _scrollController;
  late PostIdController _postIdController;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _postIdController = PostIdController(context: context);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  /// _scrollListener
  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _postIdController.loadMoreReplyData(commentId: widget.element.comment.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostIdBloc, PostIdState>(builder: (context, state) {
      var element = state.details!.data.content.firstWhere(
          (element) => element.comment.id == widget.element.comment.id);

      return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Stack(
            children: [
              ListView(
                controller: _scrollController,
                children: [
                  buildPostReply(
                    context: context,
                    element: element,
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
              buildPostReplyFloatContainer(
                context: context,
                textEditingController: _textEditingController,
                hintText: element.user.alias,
                commentId: element.comment.id,
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            buildBottomNavigationBar(context: context, isOnTap: true),
      ));
    });
  }
}
