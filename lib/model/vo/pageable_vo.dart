import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'pageable_vo.g.dart';

/// PageableVo
@JsonSerializable()
class PageableVo {
  int page;
  int size;
  bool previous;
  bool next;
  int pages;
  int? elements;

  PageableVo({
    required this.page,
    required this.size,
    required this.previous,
    required this.next,
    required this.pages,
    this.elements,
  });

  factory PageableVo.withDataResponse(Map<String, dynamic> json) {
    return PageableVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory PageableVo.fromJson(Map<String, dynamic> json) =>
      _$PageableVoFromJson(json);

  Map<String, dynamic> toJson() => _$PageableVoToJson(this);
}
