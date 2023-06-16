import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'section_group_vo.g.dart';

/// SectionGroupVo
@JsonSerializable()
class SectionGroupVo extends BaseVo {
  String name;
  int sort;
  List<SectionVo>? sections;

  SectionGroupVo({
    required this.name,
    required this.sort,
    this.sections,
    required super.id,
    required super.deleted,
  });

  factory SectionGroupVo.withDataResponse(Map<String, dynamic> json) {
    return SectionGroupVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory SectionGroupVo.fromJson(Map<String, dynamic> json) =>
      _$SectionGroupVoFromJson(json);

  Map<String, dynamic> toJson() => _$SectionGroupVoToJson(this);
}
