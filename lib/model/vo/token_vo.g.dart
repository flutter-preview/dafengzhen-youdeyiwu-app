// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenVo _$TokenVoFromJson(Map<String, dynamic> json) => TokenVo(
      id: json['id'] as int,
      alias: json['alias'] as String,
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$TokenVoToJson(TokenVo instance) => <String, dynamic>{
      'id': instance.id,
      'alias': instance.alias,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };
