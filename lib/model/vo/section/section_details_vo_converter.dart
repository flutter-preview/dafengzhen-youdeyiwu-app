import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/vo/post/post_page_vo_converter.dart';
import 'package:youdeyiwu_app/model/vo/section/section_details_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_group_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_group_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_vo.dart';

/// SectionDetailsVoConverter
class SectionDetailsVoConverter
    implements JsonConverter<SectionDetailsVo, Map<String, dynamic>> {
  const SectionDetailsVoConverter();

  @override
  SectionDetailsVo fromJson(Map<String, dynamic> json) {
    return SectionDetailsVo(
      basic: SectionVo.fromJson(json['basic']),
      content: json['content'],
      sectionGroup: json['sectionGroup'] != null
          ? SectionGroupVo.fromJson(json['sectionGroup'])
          : null,
      tags: json['tags'].map<TagVo>((e) => TagVo.fromJson(e)).toList(),
      tagGroups: json['tagGroups']
          .map<TagGroupVo>((e) => TagGroupVo.fromJson(e))
          .toList(),
      admins: json['admins'].map<UserVo>((e) => UserVo.fromJson(e)).toList(),
      data: const PostPageVoConverter().fromJson(json['data']),
    );
  }

  @override
  Map<String, dynamic> toJson(SectionDetailsVo object) {
    return {
      'basic': object.basic.toJson(),
      'content': object.content,
      'sectionGroup': object.sectionGroup?.toJson(),
      'tags': object.tags,
      'tagGroups': object.tagGroups,
      'admins': object.admins,
      'data': object.data,
    };
  }
}
