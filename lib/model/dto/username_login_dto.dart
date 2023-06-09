import 'package:json_annotation/json_annotation.dart';

part 'username_login_dto.g.dart';

/// UsernameLoginDto
@JsonSerializable()
class UsernameLoginDto {
  String username;
  String password;
  String? cid;
  String? code;

  UsernameLoginDto({
    required this.username,
    required this.password,
    this.cid,
    this.code,
  });

  factory UsernameLoginDto.fromJson(Map<String, dynamic> json) =>
      _$UsernameLoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsernameLoginDtoToJson(this);
}
