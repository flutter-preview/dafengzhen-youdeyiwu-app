// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_reply_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCommentReplyVo _$PostCommentReplyVoFromJson(Map<String, dynamic> json) =>
    PostCommentReplyVo(
      user: UserOvVo.fromJson(json['user'] as Map<String, dynamic>),
      reply: ReplyVo.fromJson(json['reply'] as Map<String, dynamic>),
      pageable: PageableVo.fromJson(json['pageable'] as Map<String, dynamic>),
      content: (json['content'] as List<dynamic>)
          .map((e) =>
              PostCommentParentReplyVo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostCommentReplyVoToJson(PostCommentReplyVo instance) =>
    <String, dynamic>{
      'user': instance.user,
      'reply': instance.reply,
      'pageable': instance.pageable,
      'content': instance.content,
    };
