import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/enums/post_content_type_enum.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/badge/badge_vo.dart';
import 'package:youdeyiwu_app/model/vo/base_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_details_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/style/style_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

part 'post_vo.g.dart';

/// PostVo
@JsonSerializable()
class PostVo extends BaseVo {
  String name;
  String? cover;
  String? overview;
  PostContentTypeEnum contentType;
  String? contentLink;
  String contentUpdatedOn;
  String? statement;
  List<String> customTags;
  List<String> images;
  List<BadgeVo> badges;
  List<StyleVo> styles;
  PostDetailsVo? details;
  SectionVo section;

  PostVo({
    required this.name,
    this.cover,
    this.overview,
    required this.contentType,
    this.contentLink,
    required this.contentUpdatedOn,
    this.statement,
    required this.badges,
    required this.styles,
    this.details,
    required this.section,
    required this.customTags,
    required this.images,
    required super.id,
    required super.deleted,
  });

  factory PostVo.withDataResponse(Map<String, dynamic> json) {
    return PostVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory PostVo.fromJson(Map<String, dynamic> json) => _$PostVoFromJson(json);

  Map<String, dynamic> toJson() => _$PostVoToJson(this);
}
