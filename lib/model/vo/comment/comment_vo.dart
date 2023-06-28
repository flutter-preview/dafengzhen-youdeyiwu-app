import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/enums/comment_review_state_enum.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'comment_vo.g.dart';

/// CommentVo
@JsonSerializable()
class CommentVo extends BaseVo {
  String content;
  int likeCount;
  CommentReviewStateEnum reviewState;

  CommentVo({
    required this.content,
    required this.likeCount,
    required this.reviewState,
    required super.id,
    required super.deleted,
  });

  factory CommentVo.withDataResponse(Map<String, dynamic> json) {
    return CommentVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory CommentVo.fromJson(Map<String, dynamic> json) =>
      _$CommentVoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentVoToJson(this);
}
