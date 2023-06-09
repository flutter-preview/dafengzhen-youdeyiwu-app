import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'yw_oauth_client_vo.g.dart';

/// YwOauthClientVo
@JsonSerializable()
class YwOauthClientVo {
  bool? enable;
  String? clientId;
  String? clientSecret;
  String? redirectUri;
  String? scope;
  String? state;
  String? clientName;
  String? clientSite;
  String? clientLogo;
  String? imagePathPrefix;
  String? remark;

  YwOauthClientVo({
    this.enable,
    this.clientId,
    this.clientSecret,
    this.redirectUri,
    this.scope,
    this.state,
    this.clientName,
    this.clientSite,
    this.clientLogo,
    this.imagePathPrefix,
    this.remark,
  });

  factory YwOauthClientVo.withDataResponse(Map<String, dynamic> json) {
    return YwOauthClientVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory YwOauthClientVo.fromJson(Map<String, dynamic> json) =>
      _$YwOauthClientVoFromJson(json);

  Map<String, dynamic> toJson() => _$YwOauthClientVoToJson(this);
}
