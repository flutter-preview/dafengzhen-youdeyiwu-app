import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/pageable_vo.dart';
import 'package:youdeyiwu_app/model/vo/reply/post_comment_parent_reply_vo.dart';
import 'package:youdeyiwu_app/model/vo/reply/reply_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'post_comment_reply_vo.g.dart';

/// PostCommentReplyVo
@JsonSerializable()
class PostCommentReplyVo {
  UserOvVo user;
  ReplyVo reply;
  PageableVo pageable;
  List<PostCommentParentReplyVo> content;

  PostCommentReplyVo({
    required this.user,
    required this.reply,
    required this.pageable,
    required this.content,
  });

  factory PostCommentReplyVo.withDataResponse(Map<String, dynamic> json) {
    return PostCommentReplyVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory PostCommentReplyVo.fromJson(Map<String, dynamic> json) =>
      _$PostCommentReplyVoFromJson(json);

  Map<String, dynamic> toJson() => _$PostCommentReplyVoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostCommentReplyVo &&
          runtimeType == other.runtimeType &&
          reply == other.reply;

  @override
  int get hashCode => reply.hashCode;
}
