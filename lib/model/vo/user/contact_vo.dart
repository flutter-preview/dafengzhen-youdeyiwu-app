import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'contact_vo.g.dart';

/// ContactVo
@JsonSerializable()
class ContactVo {
  String id;
  String key;
  String val;

  ContactVo({
    required this.id,
    required this.key,
    required this.val,
  });

  factory ContactVo.withDataResponse(Map<String, dynamic> json) {
    return ContactVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory ContactVo.fromJson(Map<String, dynamic> json) =>
      _$ContactVoFromJson(json);

  Map<String, dynamic> toJson() => _$ContactVoToJson(this);
}
