// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_config_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneConfigVo _$PhoneConfigVoFromJson(Map<String, dynamic> json) =>
    PhoneConfigVo(
      enable: json['enable'] as bool,
      total: json['total'] as int,
      interval: json['interval'] as String,
    );

Map<String, dynamic> _$PhoneConfigVoToJson(PhoneConfigVo instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'total': instance.total,
      'interval': instance.interval,
    };
