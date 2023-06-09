import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'site_config_vo.g.dart';

/// SiteConfigVo
@JsonSerializable()
class SiteConfigVo {
  String? helpLink;
  String? feedbackLink;
  String? reportLink;
  String? githubLink;
  String? mpImageLink;

  SiteConfigVo({
    this.helpLink,
    this.feedbackLink,
    this.reportLink,
    this.githubLink,
    this.mpImageLink,
  });

  factory SiteConfigVo.withDataResponse(Map<String, dynamic> json) {
    return SiteConfigVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory SiteConfigVo.fromJson(Map<String, dynamic> json) =>
      _$SiteConfigVoFromJson(json);

  Map<String, dynamic> toJson() => _$SiteConfigVoToJson(this);
}
