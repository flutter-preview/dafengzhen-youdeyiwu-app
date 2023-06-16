// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ov_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOvVo _$UserOvVoFromJson(Map<String, dynamic> json) => UserOvVo(
      id: json['id'] as int,
      alias: json['alias'] as String,
      details: UserDetailsVo.fromJson(json['details'] as Map<String, dynamic>),
      roles: (json['roles'] as List<dynamic>)
          .map((e) => RoleVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      statistic:
          StatisticVo.fromJson(json['statistic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserOvVoToJson(UserOvVo instance) => <String, dynamic>{
      'id': instance.id,
      'alias': instance.alias,
      'details': instance.details,
      'roles': instance.roles,
      'statistic': instance.statistic,
    };
