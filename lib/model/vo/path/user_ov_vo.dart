import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/path/role_vo.dart';
import 'package:youdeyiwu_app/model/vo/path/statistic_vo.dart';
import 'package:youdeyiwu_app/model/vo/path/user_details_vo.dart';

part 'user_ov_vo.g.dart';

/// UserOvVo
@JsonSerializable()
class UserOvVo {
  int id;
  String alias;
  UserDetailsVo details;
  List<RoleVo> roles;
  StatisticVo statistic;

  UserOvVo({
    required this.id,
    required this.alias,
    required this.details,
    required this.roles,
    required this.statistic,
  });

  factory UserOvVo.withDataResponse(Map<String, dynamic> json) {
    return UserOvVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory UserOvVo.fromJson(Map<String, dynamic> json) =>
      _$UserOvVoFromJson(json);

  Map<String, dynamic> toJson() => _$UserOvVoToJson(this);
}
