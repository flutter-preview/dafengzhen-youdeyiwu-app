import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/path/contact_vo.dart';

part 'user_details_vo.g.dart';

/// UserDetailsVo
@JsonSerializable()
class UserDetailsVo {
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
  });

  factory UserDetailsVo.withDataResponse(Map<String, dynamic> json) {
    return UserDetailsVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory UserDetailsVo.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsVoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsVoToJson(this);
}
