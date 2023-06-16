// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageableVo _$PageableVoFromJson(Map<String, dynamic> json) => PageableVo(
      page: json['page'] as int,
      size: json['size'] as int,
      previous: json['previous'] as bool,
      next: json['next'] as bool,
      pages: json['pages'] as int,
      elements: json['elements'] as int?,
    );

Map<String, dynamic> _$PageableVoToJson(PageableVo instance) {
  final val = <String, dynamic>{
    'page': instance.page,
    'size': instance.size,
    'previous': instance.previous,
    'next': instance.next,
    'pages': instance.pages,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('elements', instance.elements);
  return val;
}
