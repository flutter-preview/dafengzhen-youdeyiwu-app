import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

/// DataResponse
@JsonSerializable()
class DataResponse {
  int? code;
  int status;
  String message;
  dynamic data;

  DataResponse({
    this.code,
    required this.status,
    required this.message,
    this.data,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}
