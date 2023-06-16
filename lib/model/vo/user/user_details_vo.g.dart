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
      id: json['id'] as int,
      deleted: json['deleted'] as bool,
    )
      ..createdBy = json['createdBy'] as int?
      ..updatedBy = json['updatedBy'] as int?
      ..creatorAlias = json['creatorAlias'] as String?
      ..updaterAlias = json['updaterAlias'] as String?
      ..createdOn = json['createdOn'] as String?
      ..updatedOn = json['updatedOn'] as String?
      ..user = json['user'] == null
          ? null
          : UserOvVo.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$UserDetailsVoToJson(UserDetailsVo instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('updatedBy', instance.updatedBy);
  writeNotNull('creatorAlias', instance.creatorAlias);
  writeNotNull('updaterAlias', instance.updaterAlias);
  writeNotNull('createdOn', instance.createdOn);
  writeNotNull('updatedOn', instance.updatedOn);
  val['deleted'] = instance.deleted;
  writeNotNull('user', instance.user);
  writeNotNull('personalizedSignature', instance.personalizedSignature);
  writeNotNull('smallAvatarUrl', instance.smallAvatarUrl);
  writeNotNull('mediumAvatarUrl', instance.mediumAvatarUrl);
  writeNotNull('largeAvatarUrl', instance.largeAvatarUrl);
  writeNotNull('contacts', instance.contacts);
  writeNotNull('about', instance.about);
  return val;
}
