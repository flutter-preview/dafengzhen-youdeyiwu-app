// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      code: json['code'] as int?,
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  val['status'] = instance.status;
  val['message'] = instance.message;
  writeNotNull('data', instance.data);
  return val;
}
