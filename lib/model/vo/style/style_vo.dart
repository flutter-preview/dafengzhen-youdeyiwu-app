import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'style_vo.g.dart';

/// StyleVo
@JsonSerializable()
class StyleVo extends BaseVo {
  String name;
  String type;
  String colorMode;
  String color;
  String backgroundColorMode;
  String backgroundColor;
  List<String> icons;
  Map<String, String> styles;
  List<String> classes;
  bool useStyle;
  bool useClass;

  StyleVo({
    required this.name,
    required this.type,
    required this.colorMode,
    required this.color,
    required this.backgroundColorMode,
    required this.backgroundColor,
    required this.icons,
    required this.styles,
    required this.classes,
    required this.useStyle,
    required this.useClass,
    required super.id,
    required super.deleted,
  });

  factory StyleVo.withDataResponse(Map<String, dynamic> json) {
    return StyleVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory StyleVo.fromJson(Map<String, dynamic> json) =>
      _$StyleVoFromJson(json);

  Map<String, dynamic> toJson() => _$StyleVoToJson(this);
}
