import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/pageable_vo.dart';
import 'package:youdeyiwu_app/model/vo/reply/parent_reply_vo.dart';
import 'package:youdeyiwu_app/model/vo/reply/post_comment_child_reply_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'post_comment_parent_reply_vo.g.dart';

/// PostCommentParentReplyVo
@JsonSerializable()
class PostCommentParentReplyVo {
  UserOvVo user;
  ParentReplyVo reply;
  PageableVo pageable;
  List<PostCommentChildReplyVo> content;

  PostCommentParentReplyVo({
    required this.user,
    required this.reply,
    required this.pageable,
    required this.content,
  });

  factory PostCommentParentReplyVo.withDataResponse(Map<String, dynamic> json) {
    return PostCommentParentReplyVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory PostCommentParentReplyVo.fromJson(Map<String, dynamic> json) =>
      _$PostCommentParentReplyVoFromJson(json);

  Map<String, dynamic> toJson() => _$PostCommentParentReplyVoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostCommentParentReplyVo &&
          runtimeType == other.runtimeType &&
          reply == other.reply;

  @override
  int get hashCode => reply.hashCode;
}
