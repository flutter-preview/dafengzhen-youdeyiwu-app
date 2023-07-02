import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/vo/post/post_page_vo_converter.dart';
import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_details_client_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

/// UserDetailsClientVoConverter
class UserDetailsClientVoConverter
    implements JsonConverter<UserDetailsClientVo, Map<String, dynamic>> {
  const UserDetailsClientVoConverter();

  @override
  UserDetailsClientVo fromJson(Map<String, dynamic> json) {
    return UserDetailsClientVo(
      user: UserOvVo.fromJson(json['user']),
      sections: json['sections']
          .map<SectionVo>((e) => SectionVo.fromJson(e))
          .toList(),
      tags: json['tags'].map<TagVo>((e) => TagVo.fromJson(e)).toList(),
      data: const PostPageVoConverter().fromJson(json['data']),
    );
  }

  @override
  Map<String, dynamic> toJson(UserDetailsClientVo object) {
    return {
      'user': object.user.toJson(),
      'sections': object.sections,
      'tags': object.tags,
      'data': object.data,
    };
  }
}
