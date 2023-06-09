// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_config_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostConfigVo _$PostConfigVoFromJson(Map<String, dynamic> json) => PostConfigVo(
      enableCreateNotice: json['enableCreateNotice'] as bool,
      enableUpdateNotice: json['enableUpdateNotice'] as bool,
      enableUpdateContentNotice: json['enableUpdateContentNotice'] as bool,
      enableUpdateStateNotice: json['enableUpdateStateNotice'] as bool,
    );

Map<String, dynamic> _$PostConfigVoToJson(PostConfigVo instance) =>
    <String, dynamic>{
      'enableCreateNotice': instance.enableCreateNotice,
      'enableUpdateNotice': instance.enableUpdateNotice,
      'enableUpdateContentNotice': instance.enableUpdateContentNotice,
      'enableUpdateStateNotice': instance.enableUpdateStateNotice,
    };
