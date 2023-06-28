// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_child_reply_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCommentChildReplyVo _$PostCommentChildReplyVoFromJson(
        Map<String, dynamic> json) =>
    PostCommentChildReplyVo(
      user: UserOvVo.fromJson(json['user'] as Map<String, dynamic>),
      reply: ChildReplyVo.fromJson(json['reply'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostCommentChildReplyVoToJson(
        PostCommentChildReplyVo instance) =>
    <String, dynamic>{
      'user': instance.user,
      'reply': instance.reply,
    };
