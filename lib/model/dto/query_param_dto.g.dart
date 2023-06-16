// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_param_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryParamDto _$QueryParamDtoFromJson(Map<String, dynamic> json) =>
    QueryParamDto(
      id: json['id'] as String?,
      tid: json['tid'] as String?,
      tagId: json['tagId'] as String?,
      sectionId: json['sectionId'] as String?,
      sid: json['sid'] as String?,
      postId: json['postId'] as String?,
      pid: json['pid'] as String?,
      tagGroupId: json['tagGroupId'] as String?,
      tgid: json['tgid'] as String?,
      sectionGroupId: json['sectionGroupId'] as String?,
      sgid: json['sgid'] as String?,
      page: json['page'] as String?,
      size: json['size'] as String?,
      sort: json['sort'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$QueryParamDtoToJson(QueryParamDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('tid', instance.tid);
  writeNotNull('tagId', instance.tagId);
  writeNotNull('sectionId', instance.sectionId);
  writeNotNull('sid', instance.sid);
  writeNotNull('postId', instance.postId);
  writeNotNull('pid', instance.pid);
  writeNotNull('tagGroupId', instance.tagGroupId);
  writeNotNull('tgid', instance.tgid);
  writeNotNull('sectionGroupId', instance.sectionGroupId);
  writeNotNull('sgid', instance.sgid);
  writeNotNull('page', instance.page);
  writeNotNull('size', instance.size);
  writeNotNull('sort', instance.sort);
  writeNotNull('name', instance.name);
  return val;
}
