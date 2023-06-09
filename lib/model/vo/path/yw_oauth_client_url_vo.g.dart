// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yw_oauth_client_url_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YwOauthClientUrlVo _$YwOauthClientUrlVoFromJson(Map<String, dynamic> json) =>
    YwOauthClientUrlVo(
      enable: json['enable'] as bool?,
      clientId: json['clientId'] as String?,
      clientName: json['clientName'] as String?,
      clientLogo: json['clientLogo'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$YwOauthClientUrlVoToJson(YwOauthClientUrlVo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enable', instance.enable);
  writeNotNull('clientId', instance.clientId);
  writeNotNull('clientName', instance.clientName);
  writeNotNull('clientLogo', instance.clientLogo);
  writeNotNull('url', instance.url);
  return val;
}
