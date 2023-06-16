import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/contact_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'user_details_vo.g.dart';

/// UserDetailsVo
@JsonSerializable()
class UserDetailsVo extends BaseVo {
  String? personalizedSignature;
  String? smallAvatarUrl;
  String? mediumAvatarUrl;
  String? largeAvatarUrl;
  List<ContactVo>? contacts;
  String? about;

  UserDetailsVo({
    this.personalizedSignature,
    this.smallAvatarUrl,
    this.mediumAvatarUrl,
    this.largeAvatarUrl,
    this.contacts,
    this.about,
    required super.id,
    required super.deleted,
  });

  factory UserDetailsVo.withDataResponse(Map<String, dynamic> json) {
    return UserDetailsVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory UserDetailsVo.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsVoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsVoToJson(this);
}
