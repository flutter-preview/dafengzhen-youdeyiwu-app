// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCommentVo _$PostCommentVoFromJson(Map<String, dynamic> json) =>
    PostCommentVo(
      user: UserOvVo.fromJson(json['user'] as Map<String, dynamic>),
      comment: CommentVo.fromJson(json['comment'] as Map<String, dynamic>),
      pageable: PageableVo.fromJson(json['pageable'] as Map<String, dynamic>),
      content: (json['content'] as List<dynamic>)
          .map((e) => PostCommentReplyVo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostCommentVoToJson(PostCommentVo instance) =>
    <String, dynamic>{
      'user': instance.user,
      'comment': instance.comment,
      'pageable': instance.pageable,
      'content': instance.content,
    };
