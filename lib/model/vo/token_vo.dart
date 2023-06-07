import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'token_vo.g.dart';

/// TokenVo
@JsonSerializable()
class TokenVo {
  int id;
  String alias;
  String token;
  String refreshToken;

  TokenVo({
    required this.id,
    required this.alias,
    required this.token,
    required this.refreshToken,
  });

  factory TokenVo.withDataResponse(Map<String, dynamic> json) {
    return TokenVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory TokenVo.fromJson(Map<String, dynamic> json) =>
      _$TokenVoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenVoToJson(this);
}
