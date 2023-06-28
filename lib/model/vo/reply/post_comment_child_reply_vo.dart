import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/reply/child_reply_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'post_comment_child_reply_vo.g.dart';

/// PostCommentChildReplyVo
@JsonSerializable()
class PostCommentChildReplyVo {
  UserOvVo user;
  ChildReplyVo reply;

  PostCommentChildReplyVo({
    required this.user,
    required this.reply,
  });

  factory PostCommentChildReplyVo.withDataResponse(Map<String, dynamic> json) {
    return PostCommentChildReplyVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory PostCommentChildReplyVo.fromJson(Map<String, dynamic> json) =>
      _$PostCommentChildReplyVoFromJson(json);

  Map<String, dynamic> toJson() => _$PostCommentChildReplyVoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostCommentChildReplyVo &&
          runtimeType == other.runtimeType &&
          reply == other.reply;

  @override
  int get hashCode => reply.hashCode;
}
