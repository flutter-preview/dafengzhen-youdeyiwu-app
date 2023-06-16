import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'user_avatar_vo.g.dart';

/// UserAvatarVo
@JsonSerializable()
class UserAvatarVo {
  String? smallAvatarUrl;
  String? mediumAvatarUrl;
  String? largeAvatarUrl;

  UserAvatarVo({
    this.smallAvatarUrl,
    this.mediumAvatarUrl,
    this.largeAvatarUrl,
  });

  UserAvatarVo copyWith({
    String? smallAvatarUrl,
    String? mediumAvatarUrl,
    String? largeAvatarUrl,
  }) {
    return UserAvatarVo(
      smallAvatarUrl: smallAvatarUrl ?? this.smallAvatarUrl,
      mediumAvatarUrl: mediumAvatarUrl ?? this.mediumAvatarUrl,
      largeAvatarUrl: largeAvatarUrl ?? this.largeAvatarUrl,
    );
  }

  factory UserAvatarVo.withDataResponse(Map<String, dynamic> json) {
    return UserAvatarVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory UserAvatarVo.fromJson(Map<String, dynamic> json) =>
      _$UserAvatarVoFromJson(json);

  Map<String, dynamic> toJson() => _$UserAvatarVoToJson(this);
}
