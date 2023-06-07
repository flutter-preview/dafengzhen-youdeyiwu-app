// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'username_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsernameRegisterDto _$UsernameRegisterDtoFromJson(Map<String, dynamic> json) =>
    UsernameRegisterDto(
      username: json['username'] as String,
      password: json['password'] as String,
      alias: json['alias'] as String?,
      cid: json['cid'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$UsernameRegisterDtoToJson(UsernameRegisterDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('alias', instance.alias);
  val['username'] = instance.username;
  val['password'] = instance.password;
  writeNotNull('cid', instance.cid);
  writeNotNull('code', instance.code);
  return val;
}
