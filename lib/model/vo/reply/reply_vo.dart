import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/enums/reply_review_state_enum.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'reply_vo.g.dart';

/// ReplyVo
@JsonSerializable()
class ReplyVo extends BaseVo {
  String content;
  int likeCount;
  ReplyReviewStateEnum reviewState;
  bool? emptyParentReplyList;

  ReplyVo({
    required this.content,
    required this.likeCount,
    required this.reviewState,
    this.emptyParentReplyList,
    required super.id,
    required super.deleted,
  });

  factory ReplyVo.withDataResponse(Map<String, dynamic> json) {
    return ReplyVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory ReplyVo.fromJson(Map<String, dynamic> json) =>
      _$ReplyVoFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyVoToJson(this);
}
