// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_other_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostOtherVo _$PostOtherVoFromJson(Map<String, dynamic> json) => PostOtherVo(
      helpLink: json['helpLink'] as String?,
    );

Map<String, dynamic> _$PostOtherVoToJson(PostOtherVo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('helpLink', instance.helpLink);
  return val;
}
