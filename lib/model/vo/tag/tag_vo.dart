import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_group_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'tag_vo.g.dart';

/// TagVo
@JsonSerializable()
class TagVo extends BaseVo {
  String name;
  List<TagGroupVo>? tagGroups;

  TagVo({
    required this.name,
    this.tagGroups,
    required super.id,
    required super.deleted,
  });

  factory TagVo.withDataResponse(Map<String, dynamic> json) {
    return TagVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory TagVo.fromJson(Map<String, dynamic> json) => _$TagVoFromJson(json);

  Map<String, dynamic> toJson() => _$TagVoToJson(this);
}
