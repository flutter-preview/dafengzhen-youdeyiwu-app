import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'qq_config_vo.g.dart';

/// QqConfigVo
@JsonSerializable()
class QqConfigVo {
  bool enable;
  String? responseType;
  String? clientId;
  String? redirectUri;
  String? state;
  String? scope;
  String? display;
  String? grantType;

  QqConfigVo({
    required this.enable,
    this.responseType,
    this.clientId,
    this.redirectUri,
    this.state,
    this.scope,
    this.display,
    this.grantType,
  });

  factory QqConfigVo.withDataResponse(Map<String, dynamic> json) {
    return QqConfigVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory QqConfigVo.fromJson(Map<String, dynamic> json) =>
      _$QqConfigVoFromJson(json);

  Map<String, dynamic> toJson() => _$QqConfigVoToJson(this);
}
