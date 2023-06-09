import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/path/yw_oauth_client_url_vo.dart';
import 'package:youdeyiwu_app/model/vo/path/yw_oauth_client_vo.dart';

part 'oauth_client_config_vo.g.dart';

/// OauthClientConfigVo
@JsonSerializable()
class OauthClientConfigVo {
  bool? showMenuEntry;
  String? doc;
  List<YwOauthClientVo>? ywClients;
  List<YwOauthClientUrlVo>? ywClientUrls;

  OauthClientConfigVo({
    this.showMenuEntry,
    this.doc,
    this.ywClients,
    this.ywClientUrls,
  });

  factory OauthClientConfigVo.withDataResponse(Map<String, dynamic> json) {
    return OauthClientConfigVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory OauthClientConfigVo.fromJson(Map<String, dynamic> json) =>
      _$OauthClientConfigVoFromJson(json);

  Map<String, dynamic> toJson() => _$OauthClientConfigVoToJson(this);
}
