import 'package:youdeyiwu_app/model/vo/page_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_group_vo.dart';
import 'package:youdeyiwu_app/model/vo/section/section_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_group_vo.dart';
import 'package:youdeyiwu_app/model/vo/tag/tag_vo.dart';
import 'package:youdeyiwu_app/model/vo/user/user_vo.dart';

/// SectionDetailsVo
class SectionDetailsVo {
  SectionVo basic;
  String? content;
  SectionGroupVo? sectionGroup;
  List<TagVo> tags;
  List<TagGroupVo> tagGroups;
  List<UserVo> admins;
  PageVo<PostVo> data;

  SectionDetailsVo({
    required this.basic,
    this.content,
    this.sectionGroup,
    required this.tags,
    required this.tagGroups,
    required this.admins,
    required this.data,
  });
}
