import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'image_config_vo.g.dart';

/// ImageConfigVo
@JsonSerializable()
class ImageConfigVo {
  bool enable;
  int total;
  String interval;

  ImageConfigVo({
    required this.enable,
    required this.total,
    required this.interval,
  });

  factory ImageConfigVo.withDataResponse(Map<String, dynamic> json) {
    return ImageConfigVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory ImageConfigVo.fromJson(Map<String, dynamic> json) =>
      _$ImageConfigVoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageConfigVoToJson(this);
}
