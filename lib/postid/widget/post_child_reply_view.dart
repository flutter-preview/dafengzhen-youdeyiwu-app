import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/model/vo/reply/post_comment_parent_reply_vo.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_bloc.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_controller.dart';
import 'package:youdeyiwu_app/postid/bloc/post_id_state.dart';
import 'package:youdeyiwu_app/postid/widget/post_child_reply.dart';
import 'package:youdeyiwu_app/postid/widget/post_reply_float_container.dart';
import 'package:youdeyiwu_app/tool/tool.dart';

/// PostChildReplyView
class PostChildReplyView extends StatefulWidget {
  final PostCommentParentReplyVo element;
  final int commentId;
  final int replyId;

  const PostChildReplyView(
      {Key? key,
      required this.element,
      required this.commentId,
      required this.replyId})
      : super(key: key);

  @override
  State<PostChildReplyView> createState() => _PostChildReplyViewState();
}

class _PostChildReplyViewState extends State<PostChildReplyView> {
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
      _postIdController.loadMoreChildReplyData(
        commentId: widget.commentId,
        replyId: widget.replyId,
        parentReplyId: widget.element.reply.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostIdBloc, PostIdState>(builder: (context, state) {
      var element = state.details!.data.content
          .firstWhere((element) => element.comment.id == widget.commentId)
          .content
          .firstWhere((element) => element.reply.id == widget.replyId)
          .content
          .firstWhere((element) => element.reply.id == widget.element.reply.id);

      return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: Stack(
              children: [
                ListView(
                  controller: _scrollController,
                  children: [
                    buildPostChildReply(
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
                  parentReplyId: element.reply.id,
                )
              ],
            ),
          ),
          bottomNavigationBar:
              buildBottomNavigationBar(context: context, isOnTap: true),
        ),
      );
    });
  }
}
