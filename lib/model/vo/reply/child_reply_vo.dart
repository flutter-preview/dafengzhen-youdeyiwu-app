import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/enums/reply_review_state_enum.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'child_reply_vo.g.dart';

/// ChildReplyVo
@JsonSerializable()
class ChildReplyVo extends BaseVo {
  String content;
  int likeCount;
  ReplyReviewStateEnum reviewState;

  ChildReplyVo({
    required this.content,
    required this.likeCount,
    required this.reviewState,
    required super.id,
    required super.deleted,
  });

  factory ChildReplyVo.withDataResponse(Map<String, dynamic> json) {
    return ChildReplyVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory ChildReplyVo.fromJson(Map<String, dynamic> json) =>
      _$ChildReplyVoFromJson(json);

  Map<String, dynamic> toJson() => _$ChildReplyVoToJson(this);
}
