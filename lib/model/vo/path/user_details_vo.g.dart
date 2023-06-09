// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsVo _$UserDetailsVoFromJson(Map<String, dynamic> json) =>
    UserDetailsVo(
      personalizedSignature: json['personalizedSignature'] as String?,
      smallAvatarUrl: json['smallAvatarUrl'] as String?,
      mediumAvatarUrl: json['mediumAvatarUrl'] as String?,
      largeAvatarUrl: json['largeAvatarUrl'] as String?,
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => ContactVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      about: json['about'] as String?,
    );

Map<String, dynamic> _$UserDetailsVoToJson(UserDetailsVo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('personalizedSignature', instance.personalizedSignature);
  writeNotNull('smallAvatarUrl', instance.smallAvatarUrl);
  writeNotNull('mediumAvatarUrl', instance.mediumAvatarUrl);
  writeNotNull('largeAvatarUrl', instance.largeAvatarUrl);
  writeNotNull('contacts', instance.contacts);
  writeNotNull('about', instance.about);
  return val;
}
