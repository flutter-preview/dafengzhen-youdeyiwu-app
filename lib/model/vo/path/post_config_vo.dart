import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'post_config_vo.g.dart';

/// PostConfigVo
@JsonSerializable()
class PostConfigVo {
  bool enableCreateNotice;
  bool enableUpdateNotice;
  bool enableUpdateContentNotice;
  bool enableUpdateStateNotice;

  PostConfigVo({
    required this.enableCreateNotice,
    required this.enableUpdateNotice,
    required this.enableUpdateContentNotice,
    required this.enableUpdateStateNotice,
  });

  factory PostConfigVo.withDataResponse(Map<String, dynamic> json) {
    return PostConfigVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory PostConfigVo.fromJson(Map<String, dynamic> json) =>
      _$PostConfigVoFromJson(json);

  Map<String, dynamic> toJson() => _$PostConfigVoToJson(this);
}
