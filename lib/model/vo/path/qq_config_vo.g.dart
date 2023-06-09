// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qq_config_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QqConfigVo _$QqConfigVoFromJson(Map<String, dynamic> json) => QqConfigVo(
      enable: json['enable'] as bool,
      responseType: json['responseType'] as String?,
      clientId: json['clientId'] as String?,
      redirectUri: json['redirectUri'] as String?,
      state: json['state'] as String?,
      scope: json['scope'] as String?,
      display: json['display'] as String?,
      grantType: json['grantType'] as String?,
    );

Map<String, dynamic> _$QqConfigVoToJson(QqConfigVo instance) {
  final val = <String, dynamic>{
    'enable': instance.enable,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('responseType', instance.responseType);
  writeNotNull('clientId', instance.clientId);
  writeNotNull('redirectUri', instance.redirectUri);
  writeNotNull('state', instance.state);
  writeNotNull('scope', instance.scope);
  writeNotNull('display', instance.display);
  writeNotNull('grantType', instance.grantType);
  return val;
}
