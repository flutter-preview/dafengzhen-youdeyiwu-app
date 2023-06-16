import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/section/section_group_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_vo.dart';

part 'section_client_vo.g.dart';

/// SectionClientVo
@JsonSerializable()
class SectionClientVo extends SectionVo {
  int postCount;
  int tagCount;
  SectionGroupVo? sectionGroup;
  List<UserVo> admins;
  List<TagVo> tags;

  SectionClientVo({
    required this.postCount,
    required this.tagCount,
    this.sectionGroup,
    required this.admins,
    required this.tags,
    required super.name,
    required super.sort,
    required super.state,
    required super.id,
    required super.deleted,
    required super.otherStates,
    required super.allow,
    required super.block,
  });

  factory SectionClientVo.withDataResponse(Map<String, dynamic> json) {
    return SectionClientVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory SectionClientVo.fromJson(Map<String, dynamic> json) =>
      _$SectionClientVoFromJson(json);

  Map<String, dynamic> toJson() => _$SectionClientVoToJson(this);
}
