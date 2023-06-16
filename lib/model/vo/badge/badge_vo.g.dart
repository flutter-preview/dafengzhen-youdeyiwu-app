// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BadgeVo _$BadgeVoFromJson(Map<String, dynamic> json) => BadgeVo(
      name: json['name'] as String,
      sort: json['sort'] as int,
      reason: json['reason'] as String,
      colorMode: json['colorMode'] as String,
      color: json['color'] as String,
      backgroundColorMode: json['backgroundColorMode'] as String,
      backgroundColor: json['backgroundColor'] as String,
      roundedPill: json['roundedPill'] as bool,
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

Map<String, dynamic> _$BadgeVoToJson(BadgeVo instance) {
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
  val['name'] = instance.name;
  val['sort'] = instance.sort;
  val['reason'] = instance.reason;
  val['colorMode'] = instance.colorMode;
  val['color'] = instance.color;
  val['backgroundColorMode'] = instance.backgroundColorMode;
  val['backgroundColor'] = instance.backgroundColor;
  val['roundedPill'] = instance.roundedPill;
  return val;
}
