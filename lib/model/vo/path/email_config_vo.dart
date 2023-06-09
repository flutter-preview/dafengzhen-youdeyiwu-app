import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'email_config_vo.g.dart';

/// EmailConfigVo
@JsonSerializable()
class EmailConfigVo {
  bool enable;
  int total;
  String interval;

  EmailConfigVo({
    required this.enable,
    required this.total,
    required this.interval,
  });

  factory EmailConfigVo.withDataResponse(Map<String, dynamic> json) {
    return EmailConfigVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory EmailConfigVo.fromJson(Map<String, dynamic> json) =>
      _$EmailConfigVoFromJson(json);

  Map<String, dynamic> toJson() => _$EmailConfigVoToJson(this);
}
