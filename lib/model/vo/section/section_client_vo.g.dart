// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_client_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionClientVo _$SectionClientVoFromJson(Map<String, dynamic> json) =>
    SectionClientVo(
      postCount: json['postCount'] as int,
      tagCount: json['tagCount'] as int,
      sectionGroup: json['sectionGroup'] == null
          ? null
          : SectionGroupVo.fromJson(
              json['sectionGroup'] as Map<String, dynamic>),
      admins: (json['admins'] as List<dynamic>)
          .map((e) => UserVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      sort: json['sort'] as int,
      state: json['state'] as String,
      id: json['id'] as int,
      deleted: json['deleted'] as bool,
      otherStates: (json['otherStates'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      allow: (json['allow'] as List<dynamic>).map((e) => e as int).toList(),
      block: (json['block'] as List<dynamic>).map((e) => e as int).toList(),
    )
      ..createdBy = json['createdBy'] as int?
      ..updatedBy = json['updatedBy'] as int?
      ..creatorAlias = json['creatorAlias'] as String?
      ..updaterAlias = json['updaterAlias'] as String?
      ..createdOn = json['createdOn'] as String?
      ..updatedOn = json['updatedOn'] as String?
      ..user = json['user'] == null
          ? null
          : UserOvVo.fromJson(json['user'] as Map<String, dynamic>)
      ..cover = json['cover'] as String?
      ..overview = json['overview'] as String?;

Map<String, dynamic> _$SectionClientVoToJson(SectionClientVo instance) {
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
  writeNotNull('cover', instance.cover);
  writeNotNull('overview', instance.overview);
  val['sort'] = instance.sort;
  val['state'] = instance.state;
  val['otherStates'] = instance.otherStates;
  val['allow'] = instance.allow;
  val['block'] = instance.block;
  val['postCount'] = instance.postCount;
  val['tagCount'] = instance.tagCount;
  writeNotNull('sectionGroup', instance.sectionGroup);
  val['admins'] = instance.admins;
  val['tags'] = instance.tags;
  return val;
}
