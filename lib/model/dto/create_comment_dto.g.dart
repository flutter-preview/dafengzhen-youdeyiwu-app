// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCommentDto _$CreateCommentDtoFromJson(Map<String, dynamic> json) =>
    CreateCommentDto(
      postId: json['postId'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$CreateCommentDtoToJson(CreateCommentDto instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'content': instance.content,
    };
