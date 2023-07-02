import 'package:youdeyiwu_app/model/vo/page_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_ov_vo.dart';

/// UserDetailsClientVo
class UserDetailsClientVo {
  UserOvVo user;
  List<SectionVo> sections;
  List<TagVo> tags;
  PageVo<PostVo> data;

  UserDetailsClientVo({
    required this.user,
    required this.sections,
    required this.tags,
    required this.data,
  });
}
