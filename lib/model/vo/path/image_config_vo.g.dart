// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_config_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageConfigVo _$ImageConfigVoFromJson(Map<String, dynamic> json) =>
    ImageConfigVo(
      enable: json['enable'] as bool,
      total: json['total'] as int,
      interval: json['interval'] as String,
    );

Map<String, dynamic> _$ImageConfigVoToJson(ImageConfigVo instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'total': instance.total,
      'interval': instance.interval,
    };
