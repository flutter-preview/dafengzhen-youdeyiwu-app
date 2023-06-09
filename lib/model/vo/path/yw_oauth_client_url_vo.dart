import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'yw_oauth_client_url_vo.g.dart';

/// YwOauthClientUrlVo
@JsonSerializable()
class YwOauthClientUrlVo {
  bool? enable;
  String? clientId;
  String? clientName;
  String? clientLogo;
  String? url;

  YwOauthClientUrlVo({
    this.enable,
    this.clientId,
    this.clientName,
    this.clientLogo,
    this.url,
  });

  factory YwOauthClientUrlVo.withDataResponse(Map<String, dynamic> json) {
    return YwOauthClientUrlVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory YwOauthClientUrlVo.fromJson(Map<String, dynamic> json) =>
      _$YwOauthClientUrlVoFromJson(json);

  Map<String, dynamic> toJson() => _$YwOauthClientUrlVoToJson(this);
}
