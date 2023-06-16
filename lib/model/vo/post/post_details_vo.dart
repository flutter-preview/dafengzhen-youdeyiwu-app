import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'post_details_vo.g.dart';

/// PostDetailsVo
@JsonSerializable()
class PostDetailsVo extends BaseVo {
  String state;
  String reviewState;
  String sortState;
  List<String> otherStates;
  int viewCount;
  int commentCount;
  int replyCount;
  int likeCount;
  int followCount;
  int favoriteCount;
  List<int> allow;
  List<int> block;

  PostDetailsVo({
    required this.state,
    required this.reviewState,
    required this.sortState,
    required this.otherStates,
    required this.viewCount,
    required this.commentCount,
    required this.replyCount,
    required this.likeCount,
    required this.followCount,
    required this.favoriteCount,
    required this.allow,
    required this.block,
    required super.id,
    required super.deleted,
  });

  factory PostDetailsVo.withDataResponse(Map<String, dynamic> json) {
    return PostDetailsVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory PostDetailsVo.fromJson(Map<String, dynamic> json) =>
      _$PostDetailsVoFromJson(json);

  Map<String, dynamic> toJson() => _$PostDetailsVoToJson(this);
}
