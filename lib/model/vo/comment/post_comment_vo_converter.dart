import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/vo/comment/post_comment_vo.dart';
import 'package:youdeyiwu_app/model/vo/page_vo.dart';
import 'package:youdeyiwu_app/model/vo/pageable_vo.dart';

/// PostCommentVoConverter
class PostCommentVoConverter
    implements JsonConverter<PageVo<PostCommentVo>, Map<String, dynamic>> {
  const PostCommentVoConverter();

  @override
  PageVo<PostCommentVo> fromJson(Map<String, dynamic> json) {
    return PageVo(
      content: json['content']
          .map<PostCommentVo>((e) => PostCommentVo.fromJson(e))
          .toList(),
      pageable: PageableVo.fromJson(json['pageable']),
    );
  }

  @override
  Map<String, dynamic> toJson(PageVo<PostCommentVo> object) {
    return {
      'content': object.content,
      'pageable': object.pageable.toJson(),
    };
  }
}
