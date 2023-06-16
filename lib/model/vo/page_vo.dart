import 'package:youdeyiwu_app/model/vo/pageable_vo.dart';

/// PageVo
class PageVo<T> {
  List<T> content;
  PageableVo pageable;

  PageVo({
    required this.content,
    required this.pageable,
  });
}
