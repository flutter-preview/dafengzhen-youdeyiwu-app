import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'badge_vo.g.dart';

/// BadgeVo
@JsonSerializable()
class BadgeVo extends BaseVo {
  String name;
  int sort;
  String reason;
  String colorMode;
  String color;
  String backgroundColorMode;
  String backgroundColor;
  bool roundedPill;

  BadgeVo({
    required this.name,
    required this.sort,
    required this.reason,
    required this.colorMode,
    required this.color,
    required this.backgroundColorMode,
    required this.backgroundColor,
    required this.roundedPill,
    required super.id,
    required super.deleted,
  });

  factory BadgeVo.withDataResponse(Map<String, dynamic> json) {
    return BadgeVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory BadgeVo.fromJson(Map<String, dynamic> json) =>
      _$BadgeVoFromJson(json);

  Map<String, dynamic> toJson() => _$BadgeVoToJson(this);
}
