// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticVo _$StatisticVoFromJson(Map<String, dynamic> json) => StatisticVo(
      posts: json['posts'] as int,
      sections: json['sections'] as int,
      tags: json['tags'] as int,
      comments: json['comments'] as int,
      replies: json['replies'] as int,
      views: json['views'] as int,
    );

Map<String, dynamic> _$StatisticVoToJson(StatisticVo instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'sections': instance.sections,
      'tags': instance.tags,
      'comments': instance.comments,
      'replies': instance.replies,
      'views': instance.views,
    };
