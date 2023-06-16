// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleVo _$RoleVoFromJson(Map<String, dynamic> json) => RoleVo(
      name: json['name'] as String,
      sort: json['sort'] as int,
      hide: json['hide'] as bool,
    );

Map<String, dynamic> _$RoleVoToJson(RoleVo instance) => <String, dynamic>{
      'name': instance.name,
      'sort': instance.sort,
      'hide': instance.hide,
    };
