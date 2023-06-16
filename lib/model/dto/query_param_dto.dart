import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'query_param_dto.g.dart';

/// QueryParamDto
@JsonSerializable()
class QueryParamDto {
  String? id;
  String? tid;
  String? tagId;
  String? sectionId;
  String? sid;
  String? postId;
  String? pid;
  String? tagGroupId;
  String? tgid;
  String? sectionGroupId;
  String? sgid;
  String? page;
  String? size;
  String? sort;
  String? name;

  QueryParamDto({
    this.id,
    this.tid,
    this.tagId,
    this.sectionId,
    this.sid,
    this.postId,
    this.pid,
    this.tagGroupId,
    this.tgid,
    this.sectionGroupId,
    this.sgid,
    this.page,
    this.size,
    this.sort,
    this.name,
  });

  factory QueryParamDto.withDataResponse(Map<String, dynamic> json) {
    return QueryParamDto.fromJson(DataResponse.fromJson(json).data);
  }

  factory QueryParamDto.fromJson(Map<String, dynamic> json) =>
      _$QueryParamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QueryParamDtoToJson(this);
}
