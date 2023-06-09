// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_config_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailConfigVo _$EmailConfigVoFromJson(Map<String, dynamic> json) =>
    EmailConfigVo(
      enable: json['enable'] as bool,
      total: json['total'] as int,
      interval: json['interval'] as String,
    );

Map<String, dynamic> _$EmailConfigVoToJson(EmailConfigVo instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'total': instance.total,
      'interval': instance.interval,
    };
