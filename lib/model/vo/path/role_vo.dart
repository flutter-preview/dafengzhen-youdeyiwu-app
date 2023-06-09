import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'role_vo.g.dart';

/// RoleVo
@JsonSerializable()
class RoleVo {
  String name;
  int sort;
  bool hide;

  RoleVo({
    required this.name,
    required this.sort,
    required this.hide,
  });

  factory RoleVo.withDataResponse(Map<String, dynamic> json) {
    return RoleVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory RoleVo.fromJson(Map<String, dynamic> json) => _$RoleVoFromJson(json);

  Map<String, dynamic> toJson() => _$RoleVoToJson(this);
}
