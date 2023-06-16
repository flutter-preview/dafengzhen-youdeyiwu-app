import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/vo/page_vo.dart';
import 'package:youdeyiwu_app/model/vo/pageable_vo.dart';
import 'package:youdeyiwu_app/model/vo/post/post_vo.dart';

/// PostPageVoConverter
class PostPageVoConverter
    implements JsonConverter<PageVo<PostVo>, Map<String, dynamic>> {
  const PostPageVoConverter();

  @override
  PageVo<PostVo> fromJson(Map<String, dynamic> json) {
    return PageVo(
      content: json['content'].map<PostVo>((e) => PostVo.fromJson(e)).toList(),
      pageable: PageableVo.fromJson(json['pageable']),
    );
  }

  @override
  Map<String, dynamic> toJson(PageVo<PostVo> object) {
    return {
      'content': object.content,
      'pageable': object.pageable.toJson(),
    };
  }
}
