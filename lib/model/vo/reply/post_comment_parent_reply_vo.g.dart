// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_parent_reply_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCommentParentReplyVo _$PostCommentParentReplyVoFromJson(
        Map<String, dynamic> json) =>
    PostCommentParentReplyVo(
      user: UserOvVo.fromJson(json['user'] as Map<String, dynamic>),
      reply: ParentReplyVo.fromJson(json['reply'] as Map<String, dynamic>),
      pageable: PageableVo.fromJson(json['pageable'] as Map<String, dynamic>),
      content: (json['content'] as List<dynamic>)
          .map((e) =>
              PostCommentChildReplyVo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostCommentParentReplyVoToJson(
        PostCommentParentReplyVo instance) =>
    <String, dynamic>{
      'user': instance.user,
      'reply': instance.reply,
      'pageable': instance.pageable,
      'content': instance.content,
    };
