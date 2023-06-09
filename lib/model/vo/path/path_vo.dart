import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';
import 'package:youdeyiwu_app/model/vo/path/email_config_vo.dart';
import 'package:youdeyiwu_app/model/vo/path/image_config_vo.dart';
import 'package:youdeyiwu_app/model/vo/path/oauth_client_config_vo.dart';
import 'package:youdeyiwu_app/model/vo/path/phone_config_vo.dart';
import 'package:youdeyiwu_app/model/vo/path/post_config_vo.dart';
import 'package:youdeyiwu_app/model/vo/path/post_other_vo.dart';
import 'package:youdeyiwu_app/model/vo/path/qq_config_vo.dart';
import 'package:youdeyiwu_app/model/vo/path/site_config_vo.dart';
import 'package:youdeyiwu_app/model/vo/path/user_ov_vo.dart';

part 'path_vo.g.dart';

/// PathVo
@JsonSerializable()
class PathVo {
  SiteConfigVo? siteConfig;
  ImageConfigVo? imageConfig;
  PhoneConfigVo? phoneConfig;
  EmailConfigVo? emailConfig;
  OauthClientConfigVo? clientConfig;
  QqConfigVo? qqConfig;
  PostConfigVo? postConfig;
  PostOtherVo? postOther;
  UserOvVo? user;

  PathVo({
    this.siteConfig,
    this.imageConfig,
    this.phoneConfig,
    this.emailConfig,
    this.postConfig,
    this.user,
  });

  factory PathVo.withDataResponse(Map<String, dynamic> json) {
    return PathVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory PathVo.fromJson(Map<String, dynamic> json) => _$PathVoFromJson(json);

  Map<String, dynamic> toJson() => _$PathVoToJson(this);
}
