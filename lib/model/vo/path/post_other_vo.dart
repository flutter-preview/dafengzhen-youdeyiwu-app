import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'post_other_vo.g.dart';

/// PostOtherVo
@JsonSerializable()
class PostOtherVo {
  String? helpLink;

  PostOtherVo({
    this.helpLink,
  });

  factory PostOtherVo.withDataResponse(Map<String, dynamic> json) {
    return PostOtherVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory PostOtherVo.fromJson(Map<String, dynamic> json) =>
      _$PostOtherVoFromJson(json);

  Map<String, dynamic> toJson() => _$PostOtherVoToJson(this);
}
