import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/enums/reply_review_state_enum.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'parent_reply_vo.g.dart';

/// ParentReplyVo
@JsonSerializable()
class ParentReplyVo extends BaseVo {
  String content;
  int likeCount;
  ReplyReviewStateEnum reviewState;
  bool? emptyChildReplyList;

  ParentReplyVo({
    required this.content,
    required this.likeCount,
    required this.reviewState,
    this.emptyChildReplyList,
    required super.id,
    required super.deleted,
  });

  factory ParentReplyVo.withDataResponse(Map<String, dynamic> json) {
    return ParentReplyVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory ParentReplyVo.fromJson(Map<String, dynamic> json) =>
      _$ParentReplyVoFromJson(json);

  Map<String, dynamic> toJson() => _$ParentReplyVoToJson(this);
}
