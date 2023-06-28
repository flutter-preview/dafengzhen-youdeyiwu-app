import 'package:youdeyiwu_app/model/vo/comment/post_comment_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_details_client_vo.dart';
import 'package:youdeyiwu_app/model/vo/reply/post_comment_parent_reply_vo.dart';
import 'package:youdeyiwu_app/model/vo/reply/post_comment_reply_vo.dart';

/// PostIdEvent
abstract class PostIdEvent {
  const PostIdEvent();
}

/// UpdateDataPostIdEvent
class UpdateDataPostIdEvent extends PostIdEvent {
  final PostDetailsClientVo? details;

  const UpdateDataPostIdEvent({
    this.details,
  }) : super();
}

/// MergeCommentDataPostIdEvent
class MergeCommentDataPostIdEvent extends PostIdEvent {
  final PostDetailsClientVo? details;

  const MergeCommentDataPostIdEvent({
    this.details,
  }) : super();
}

/// MergeReplyDataPostIdEvent
class MergeReplyDataPostIdEvent extends PostIdEvent {
  final PostCommentVo details;

  const MergeReplyDataPostIdEvent({
    required this.details,
  }) : super();
}

/// MergeParentReplyDataPostIdEvent
class MergeParentReplyDataPostIdEvent extends PostIdEvent {
  final PostCommentReplyVo details;
  final int commentId;

  const MergeParentReplyDataPostIdEvent({
    required this.details,
    required this.commentId,
  }) : super();
}

/// MergeChildReplyDataPostIdEvent
class MergeChildReplyDataPostIdEvent extends PostIdEvent {
  final PostCommentParentReplyVo details;
  final int commentId;
  final int replyId;
  final int parentReplyId;

  const MergeChildReplyDataPostIdEvent({
    required this.details,
    required this.commentId,
    required this.replyId,
    required this.parentReplyId,
  }) : super();
}

/// UpdateIsLoadingPostIdEvent
class UpdateIsLoadingPostIdEvent extends PostIdEvent {
  final bool isLoading;

  const UpdateIsLoadingPostIdEvent(this.isLoading) : super();
}
