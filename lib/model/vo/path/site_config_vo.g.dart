// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_config_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteConfigVo _$SiteConfigVoFromJson(Map<String, dynamic> json) => SiteConfigVo(
      helpLink: json['helpLink'] as String?,
      feedbackLink: json['feedbackLink'] as String?,
      reportLink: json['reportLink'] as String?,
      githubLink: json['githubLink'] as String?,
      mpImageLink: json['mpImageLink'] as String?,
    );

Map<String, dynamic> _$SiteConfigVoToJson(SiteConfigVo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('helpLink', instance.helpLink);
  writeNotNull('feedbackLink', instance.feedbackLink);
  writeNotNull('reportLink', instance.reportLink);
  writeNotNull('githubLink', instance.githubLink);
  writeNotNull('mpImageLink', instance.mpImageLink);
  return val;
}
