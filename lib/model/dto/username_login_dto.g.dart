// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'username_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsernameLoginDto _$UsernameLoginDtoFromJson(Map<String, dynamic> json) =>
    UsernameLoginDto(
      username: json['username'] as String,
      password: json['password'] as String,
      cid: json['cid'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$UsernameLoginDtoToJson(UsernameLoginDto instance) {
  final val = <String, dynamic>{
    'username': instance.username,
    'password': instance.password,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cid', instance.cid);
  writeNotNull('code', instance.code);
  return val;
}
