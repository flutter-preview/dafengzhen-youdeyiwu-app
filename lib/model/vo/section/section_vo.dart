import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'section_vo.g.dart';

/// SectionVo
@JsonSerializable()
class SectionVo extends BaseVo {
  String name;
  String? cover;
  String? overview;
  int sort;
  String state;
  List<String> otherStates;
  List<int> allow;
  List<int> block;

  SectionVo({
    required this.name,
    this.cover,
    this.overview,
    required this.sort,
    required this.state,
    required this.otherStates,
    required this.allow,
    required this.block,
    required super.id,
    required super.deleted,
  });

  factory SectionVo.withDataResponse(Map<String, dynamic> json) {
    return SectionVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory SectionVo.fromJson(Map<String, dynamic> json) =>
      _$SectionVoFromJson(json);

  Map<String, dynamic> toJson() => _$SectionVoToJson(this);
}
