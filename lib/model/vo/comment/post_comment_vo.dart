import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/comment/comment_vo.dart';
import 'package:youdeyiwu_app/model/vo/pageable_vo.dart';
import 'package:youdeyiwu_app/model/vo/reply/post_comment_reply_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'post_comment_vo.g.dart';

/// PostCommentVo
@JsonSerializable()
class PostCommentVo {
  UserOvVo user;
  CommentVo comment;
  PageableVo pageable;
  List<PostCommentReplyVo> content;

  PostCommentVo({
    required this.user,
    required this.comment,
    required this.pageable,
    required this.content,
  });

  factory PostCommentVo.withDataResponse(Map<String, dynamic> json) {
    return PostCommentVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory PostCommentVo.fromJson(Map<String, dynamic> json) =>
      _$PostCommentVoFromJson(json);

  Map<String, dynamic> toJson() => _$PostCommentVoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostCommentVo &&
          runtimeType == other.runtimeType &&
          comment == other.comment;

  @override
  int get hashCode => comment.hashCode;
}
