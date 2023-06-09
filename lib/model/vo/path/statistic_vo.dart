import 'package:json_annotation/json_annotation.dart';
import 'package:youdeyiwu_app/model/response/data_response.dart';

part 'statistic_vo.g.dart';

/// StatisticVo
@JsonSerializable()
class StatisticVo {
  int posts;
  int sections;
  int tags;
  int comments;
  int replies;
  int views;

  StatisticVo({
    required this.posts,
    required this.sections,
    required this.tags,
    required this.comments,
    required this.replies,
    required this.views,
  });

  factory StatisticVo.withDataResponse(Map<String, dynamic> json) {
    return StatisticVo.fromJson(DataResponse.fromJson(json).data);
  }

  factory StatisticVo.fromJson(Map<String, dynamic> json) =>
      _$StatisticVoFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticVoToJson(this);
}
