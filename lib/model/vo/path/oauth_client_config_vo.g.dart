// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_client_config_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OauthClientConfigVo _$OauthClientConfigVoFromJson(Map<String, dynamic> json) =>
    OauthClientConfigVo(
      showMenuEntry: json['showMenuEntry'] as bool?,
      doc: json['doc'] as String?,
      ywClients: (json['ywClients'] as List<dynamic>?)
          ?.map((e) => YwOauthClientVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      ywClientUrls: (json['ywClientUrls'] as List<dynamic>?)
          ?.map((e) => YwOauthClientUrlVo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OauthClientConfigVoToJson(OauthClientConfigVo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('showMenuEntry', instance.showMenuEntry);
  writeNotNull('doc', instance.doc);
  writeNotNull('ywClients', instance.ywClients);
  writeNotNull('ywClientUrls', instance.ywClientUrls);
  return val;
}
