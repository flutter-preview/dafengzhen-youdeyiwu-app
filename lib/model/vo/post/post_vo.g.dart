// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostVo _$PostVoFromJson(Map<String, dynamic> json) => PostVo(
      name: json['name'] as String,
      cover: json['cover'] as String?,
      overview: json['overview'] as String?,
      contentUpdatedOn: json['contentUpdatedOn'] as String,
      statement: json['statement'] as String?,
      badges: (json['badges'] as List<dynamic>)
          .map((e) => BadgeVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      styles: (json['styles'] as List<dynamic>)
          .map((e) => StyleVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      details: PostDetailsVo.fromJson(json['details'] as Map<String, dynamic>),
      section: SectionVo.fromJson(json['section'] as Map<String, dynamic>),
      customTags: (json['customTags'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
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

Map<String, dynamic> _$PostVoToJson(PostVo instance) {
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
  val['contentUpdatedOn'] = instance.contentUpdatedOn;
  writeNotNull('statement', instance.statement);
  val['customTags'] = instance.customTags;
  val['images'] = instance.images;
  val['badges'] = instance.badges;
  val['styles'] = instance.styles;
  val['details'] = instance.details;
  val['section'] = instance.section;
  return val;
}
