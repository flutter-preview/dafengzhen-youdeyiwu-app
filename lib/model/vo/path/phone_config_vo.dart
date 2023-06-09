import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'phone_config_vo.g.dart';

/// PhoneConfigVo
@JsonSerializable()
class PhoneConfigVo {
  bool enable;
  int total;
  String interval;

  PhoneConfigVo({
    required this.enable,
    required this.total,
    required this.interval,
  });

  factory PhoneConfigVo.withDataResponse(Map<String, dynamic> json) {
    return PhoneConfigVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory PhoneConfigVo.fromJson(Map<String, dynamic> json) =>
      _$PhoneConfigVoFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneConfigVoToJson(this);
}
