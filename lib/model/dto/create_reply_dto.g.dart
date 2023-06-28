// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_reply_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReplyDto _$CreateReplyDtoFromJson(Map<String, dynamic> json) =>
    CreateReplyDto(
      commentId: json['commentId'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$CreateReplyDtoToJson(CreateReplyDto instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'content': instance.content,
    };
