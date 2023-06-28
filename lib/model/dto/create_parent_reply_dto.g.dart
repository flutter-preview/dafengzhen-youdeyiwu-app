// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_parent_reply_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateParentReplyDto _$CreateParentReplyDtoFromJson(
        Map<String, dynamic> json) =>
    CreateParentReplyDto(
      replyId: json['replyId'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$CreateParentReplyDtoToJson(
        CreateParentReplyDto instance) =>
    <String, dynamic>{
      'replyId': instance.replyId,
      'content': instance.content,
    };
