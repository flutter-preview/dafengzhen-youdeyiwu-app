import 'package:youdeyiwu_app/model/vo/comment/post_comment_vo.dart';
import 'package:youdeyiwu_app/model/vo/page_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_details_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

/// PostDetailsClientVo
class PostDetailsClientVo {
  UserOvVo user;
  PostVo basic;
  PostDetailsVo details;
  String content;
  SectionVo section;
  PageVo<PostCommentVo> data;
  bool? isLike;
  bool? isFollow;
  bool? isFavourite;

  PostDetailsClientVo({
    required this.user,
    required this.basic,
    required this.details,
    required this.content,
    required this.section,
    required this.data,
    this.isLike,
    this.isFollow,
    this.isFavourite,
  });
}
