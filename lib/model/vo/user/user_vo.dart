import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_details_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'user_vo.g.dart';

/// UserVo
@JsonSerializable()
class UserVo extends BaseVo {
  String? alias;
  String? username;
  String? phone;
  String? email;
  String? qqOpenId;
  String? qqUnionId;
  String? wxOpenId;
  String? wxUnionId;
  bool? accountNonExpired;
  bool? credentialsNonExpired;
  bool? accountNonLocked;
  bool? enabled;
  String? lastLoginTime;
  UserDetailsVo? details;

  UserVo({
    this.alias,
    this.username,
    this.phone,
    this.email,
    this.qqOpenId,
    this.qqUnionId,
    this.wxOpenId,
    this.wxUnionId,
    this.accountNonExpired,
    this.credentialsNonExpired,
    this.accountNonLocked,
    this.enabled,
    this.lastLoginTime,
    this.details,
    required super.id,
    required super.deleted,
  });

  factory UserVo.withDataResponse(Map<String, dynamic> json) {
    return UserVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory UserVo.fromJson(Map<String, dynamic> json) => _$UserVoFromJson(json);

  Map<String, dynamic> toJson() => _$UserVoToJson(this);
}
