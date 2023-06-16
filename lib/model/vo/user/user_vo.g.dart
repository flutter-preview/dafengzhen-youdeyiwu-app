// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVo _$UserVoFromJson(Map<String, dynamic> json) => UserVo(
      alias: json['alias'] as String?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      qqOpenId: json['qqOpenId'] as String?,
      qqUnionId: json['qqUnionId'] as String?,
      wxOpenId: json['wxOpenId'] as String?,
      wxUnionId: json['wxUnionId'] as String?,
      accountNonExpired: json['accountNonExpired'] as bool?,
      credentialsNonExpired: json['credentialsNonExpired'] as bool?,
      accountNonLocked: json['accountNonLocked'] as bool?,
      enabled: json['enabled'] as bool?,
      lastLoginTime: json['lastLoginTime'] as String?,
      details: json['details'] == null
          ? null
          : UserDetailsVo.fromJson(json['details'] as Map<String, dynamic>),
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

Map<String, dynamic> _$UserVoToJson(UserVo instance) {
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
  writeNotNull('alias', instance.alias);
  writeNotNull('username', instance.username);
  writeNotNull('phone', instance.phone);
  writeNotNull('email', instance.email);
  writeNotNull('qqOpenId', instance.qqOpenId);
  writeNotNull('qqUnionId', instance.qqUnionId);
  writeNotNull('wxOpenId', instance.wxOpenId);
  writeNotNull('wxUnionId', instance.wxUnionId);
  writeNotNull('accountNonExpired', instance.accountNonExpired);
  writeNotNull('credentialsNonExpired', instance.credentialsNonExpired);
  writeNotNull('accountNonLocked', instance.accountNonLocked);
  writeNotNull('enabled', instance.enabled);
  writeNotNull('lastLoginTime', instance.lastLoginTime);
  writeNotNull('details', instance.details);
  return val;
}
