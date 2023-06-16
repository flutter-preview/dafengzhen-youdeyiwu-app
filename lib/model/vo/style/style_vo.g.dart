// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'style_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StyleVo _$StyleVoFromJson(Map<String, dynamic> json) => StyleVo(
      name: json['name'] as String,
      type: json['type'] as String,
      colorMode: json['colorMode'] as String,
      color: json['color'] as String,
      backgroundColorMode: json['backgroundColorMode'] as String,
      backgroundColor: json['backgroundColor'] as String,
      icons: (json['icons'] as List<dynamic>).map((e) => e as String).toList(),
      styles: Map<String, String>.from(json['styles'] as Map),
      classes:
          (json['classes'] as List<dynamic>).map((e) => e as String).toList(),
      useStyle: json['useStyle'] as bool,
      useClass: json['useClass'] as bool,
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

Map<String, dynamic> _$StyleVoToJson(StyleVo instance) {
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
  val['type'] = instance.type;
  val['colorMode'] = instance.colorMode;
  val['color'] = instance.color;
  val['backgroundColorMode'] = instance.backgroundColorMode;
  val['backgroundColor'] = instance.backgroundColor;
  val['icons'] = instance.icons;
  val['styles'] = instance.styles;
  val['classes'] = instance.classes;
  val['useStyle'] = instance.useStyle;
  val['useClass'] = instance.useClass;
  return val;
}
