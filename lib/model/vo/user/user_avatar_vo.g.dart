// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_avatar_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAvatarVo _$UserAvatarVoFromJson(Map<String, dynamic> json) => UserAvatarVo(
      smallAvatarUrl: json['smallAvatarUrl'] as String?,
      mediumAvatarUrl: json['mediumAvatarUrl'] as String?,
      largeAvatarUrl: json['largeAvatarUrl'] as String?,
    );

Map<String, dynamic> _$UserAvatarVoToJson(UserAvatarVo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('smallAvatarUrl', instance.smallAvatarUrl);
  writeNotNull('mediumAvatarUrl', instance.mediumAvatarUrl);
  writeNotNull('largeAvatarUrl', instance.largeAvatarUrl);
  return val;
}
