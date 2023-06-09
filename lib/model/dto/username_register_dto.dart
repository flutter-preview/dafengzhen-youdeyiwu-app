import 'package:json_annotation/json_annotation.dart';

part 'username_register_dto.g.dart';

/// UsernameRegisterDto
@JsonSerializable()
class UsernameRegisterDto {
  String? alias;
  String username;
  String password;
  String? cid;
  String? code;

  UsernameRegisterDto({
    required this.username,
    required this.password,
    this.alias,
    this.cid,
    this.code,
  });

  factory UsernameRegisterDto.fromJson(Map<String, dynamic> json) =>
      _$UsernameRegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsernameRegisterDtoToJson(this);
}
