// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_group_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagGroupVo _$TagGroupVoFromJson(Map<String, dynamic> json) => TagGroupVo(
      name: json['name'] as String,
      sort: json['sort'] as int,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagVo.fromJson(e as Map<String, dynamic>))
          .toList(),
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

Map<String, dynamic> _$TagGroupVoToJson(TagGroupVo instance) {
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
  writeNotNull('tags', instance.tags);
  return val;
}
