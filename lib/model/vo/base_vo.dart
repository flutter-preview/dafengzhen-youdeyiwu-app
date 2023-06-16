import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'base_vo.g.dart';

/// BaseVo
@JsonSerializable()
class BaseVo {
  int id;
  int? createdBy;
  int? updatedBy;
  String? creatorAlias;
  String? updaterAlias;
  String? createdOn;
  String? updatedOn;
  bool deleted;
  UserOvVo? user;

  BaseVo({
    required this.id,
    this.createdBy,
    this.updatedBy,
    this.creatorAlias,
    this.updaterAlias,
    this.createdOn,
    this.updatedOn,
    this.user,
    required this.deleted,
  });

  factory BaseVo.withDataResponse(Map<String, dynamic> json) {
    return BaseVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory BaseVo.fromJson(Map<String, dynamic> json) => _$BaseVoFromJson(json);

  Map<String, dynamic> toJson() => _$BaseVoToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseVo && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
