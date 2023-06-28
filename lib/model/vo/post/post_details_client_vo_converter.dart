import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/vo/comment/post_comment_vo_converter.dart';
import 'package:youdeyiwu_app/model/vo/post/post_details_client_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_details_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

/// PostDetailsClientVoConverter
class PostDetailsClientVoConverter
    implements JsonConverter<PostDetailsClientVo, Map<String, dynamic>> {
  const PostDetailsClientVoConverter();

  @override
  PostDetailsClientVo fromJson(Map<String, dynamic> json) {
    return PostDetailsClientVo(
      user: UserOvVo.fromJson(json['user']),
      basic: PostVo.fromJson(json['basic']),
      details: PostDetailsVo.fromJson(json['details']),
      content: json['content'],
      section: SectionVo.fromJson(json['section']),
      data: const PostCommentVoConverter().fromJson(json['data']),
      isLike: json['isLike'],
      isFollow: json['isFollow'],
      isFavourite: json['isFavourite'],
    );
  }

  @override
  Map<String, dynamic> toJson(PostDetailsClientVo object) {
    return {
      'user': object.user.toJson(),
      'basic': object.basic.toJson(),
      'details': object.details.toJson(),
      'content': object.content,
      'section': object.section.toJson(),
      'data': object.data,
      'isLike': object.isLike,
      'isFollow': object.isFollow,
      'isFavourite': object.isFavourite,
    };
  }
}
