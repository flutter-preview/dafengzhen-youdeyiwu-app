// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionVo _$SectionVoFromJson(Map<String, dynamic> json) => SectionVo(
      name: json['name'] as String,
      cover: json['cover'] as String?,
      overview: json['overview'] as String?,
      sort: json['sort'] as int,
      state: json['state'] as String,
      otherStates: (json['otherStates'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      allow: (json['allow'] as List<dynamic>).map((e) => e as int).toList(),
      block: (json['block'] as List<dynamic>).map((e) => e as int).toList(),
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

Map<String, dynamic> _$SectionVoToJson(SectionVo instance) {
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
  return val;
}
