import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'tag_group_vo.g.dart';

/// TagGroupVo
@JsonSerializable()
class TagGroupVo extends BaseVo {
  String name;
  int sort;
  List<TagVo>? tags;

  TagGroupVo({
    required this.name,
    required this.sort,
    this.tags,
    required super.id,
    required super.deleted,
  });

  factory TagGroupVo.withDataResponse(Map<String, dynamic> json) {
    return TagGroupVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory TagGroupVo.fromJson(Map<String, dynamic> json) =>
      _$TagGroupVoFromJson(json);

  Map<String, dynamic> toJson() => _$TagGroupVoToJson(this);
}
