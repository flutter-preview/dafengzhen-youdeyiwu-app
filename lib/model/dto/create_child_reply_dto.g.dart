// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_child_reply_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChildReplyDto _$CreateChildReplyDtoFromJson(Map<String, dynamic> json) =>
    CreateChildReplyDto(
      parentReplyId: json['parentReplyId'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$CreateChildReplyDtoToJson(
        CreateChildReplyDto instance) =>
    <String, dynamic>{
      'parentReplyId': instance.parentReplyId,
      'content': instance.content,
    };
