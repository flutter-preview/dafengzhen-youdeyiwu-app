// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PathVo _$PathVoFromJson(Map<String, dynamic> json) => PathVo(
      siteConfig: json['siteConfig'] == null
          ? null
          : SiteConfigVo.fromJson(json['siteConfig'] as Map<String, dynamic>),
      imageConfig: json['imageConfig'] == null
          ? null
          : ImageConfigVo.fromJson(json['imageConfig'] as Map<String, dynamic>),
      phoneConfig: json['phoneConfig'] == null
          ? null
          : PhoneConfigVo.fromJson(json['phoneConfig'] as Map<String, dynamic>),
      emailConfig: json['emailConfig'] == null
          ? null
          : EmailConfigVo.fromJson(json['emailConfig'] as Map<String, dynamic>),
      postConfig: json['postConfig'] == null
          ? null
          : PostConfigVo.fromJson(json['postConfig'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserOvVo.fromJson(json['user'] as Map<String, dynamic>),
    )
      ..clientConfig = json['clientConfig'] == null
          ? null
          : OauthClientConfigVo.fromJson(
              json['clientConfig'] as Map<String, dynamic>)
      ..qqConfig = json['qqConfig'] == null
          ? null
          : QqConfigVo.fromJson(json['qqConfig'] as Map<String, dynamic>)
      ..postOther = json['postOther'] == null
          ? null
          : PostOtherVo.fromJson(json['postOther'] as Map<String, dynamic>);

Map<String, dynamic> _$PathVoToJson(PathVo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('siteConfig', instance.siteConfig);
  writeNotNull('imageConfig', instance.imageConfig);
  writeNotNull('phoneConfig', instance.phoneConfig);
  writeNotNull('emailConfig', instance.emailConfig);
  writeNotNull('clientConfig', instance.clientConfig);
  writeNotNull('qqConfig', instance.qqConfig);
  writeNotNull('postConfig', instance.postConfig);
  writeNotNull('postOther', instance.postOther);
  writeNotNull('user', instance.user);
  return val;
}
