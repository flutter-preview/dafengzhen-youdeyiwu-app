import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'query_param_dto.g.dart';

/// QueryParamDto
@CopyWith()
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
  String? sectionSecret;
  String? postSecret;
  String? secret;

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
    this.sectionSecret,
    this.postSecret,
    this.secret,
  });

  factory QueryParamDto.withDataResponse(Map<String, dynamic> json) {
    return QueryParamDto.fromJson(DataResponse.fromJson(json).data);
  }

  factory QueryParamDto.fromJson(Map<String, dynamic> json) =>
      _$QueryParamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QueryParamDtoToJson(this);
}
