// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yw_oauth_client_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YwOauthClientVo _$YwOauthClientVoFromJson(Map<String, dynamic> json) =>
    YwOauthClientVo(
      enable: json['enable'] as bool?,
      clientId: json['clientId'] as String?,
      clientSecret: json['clientSecret'] as String?,
      redirectUri: json['redirectUri'] as String?,
      scope: json['scope'] as String?,
      state: json['state'] as String?,
      clientName: json['clientName'] as String?,
      clientSite: json['clientSite'] as String?,
      clientLogo: json['clientLogo'] as String?,
      imagePathPrefix: json['imagePathPrefix'] as String?,
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$YwOauthClientVoToJson(YwOauthClientVo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enable', instance.enable);
  writeNotNull('clientId', instance.clientId);
  writeNotNull('clientSecret', instance.clientSecret);
  writeNotNull('redirectUri', instance.redirectUri);
  writeNotNull('scope', instance.scope);
  writeNotNull('state', instance.state);
  writeNotNull('clientName', instance.clientName);
  writeNotNull('clientSite', instance.clientSite);
  writeNotNull('clientLogo', instance.clientLogo);
  writeNotNull('imagePathPrefix', instance.imagePathPrefix);
  writeNotNull('remark', instance.remark);
  return val;
}
