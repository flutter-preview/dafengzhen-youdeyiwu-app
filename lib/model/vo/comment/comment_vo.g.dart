// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentVo _$CommentVoFromJson(Map<String, dynamic> json) => CommentVo(
      content: json['content'] as String,
      likeCount: json['likeCount'] as int,
      reviewState:
          $enumDecode(_$CommentReviewStateEnumEnumMap, json['reviewState']),
      id: json['id'] as int,
      deleted: json['deleted'] as bool,
    )
      ..createdBy = json['createdBy'] as int?
      ..updatedBy = json['updatedBy'] as int?
      ..creatorAlias = json['creatorAlias'] as String?
      ..updaterAlias = json['updaterAlias'] as String?
      ..createdOn = json['createdOn'] as String?
      ..updatedOn = json['updatedOn'] as String?
      ..user = json['user'] == null
          ? null
          : UserOvVo.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$CommentVoToJson(CommentVo instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('updatedBy', instance.updatedBy);
  writeNotNull('creatorAlias', instance.creatorAlias);
  writeNotNull('updaterAlias', instance.updaterAlias);
  writeNotNull('createdOn', instance.createdOn);
  writeNotNull('updatedOn', instance.updatedOn);
  val['deleted'] = instance.deleted;
  writeNotNull('user', instance.user);
  val['content'] = instance.content;
  val['likeCount'] = instance.likeCount;
  val['reviewState'] = _$CommentReviewStateEnumEnumMap[instance.reviewState]!;
  return val;
}

const _$CommentReviewStateEnumEnumMap = {
  CommentReviewStateEnum.APPROVED: 'APPROVED',
  CommentReviewStateEnum.DENIED: 'DENIED',
  CommentReviewStateEnum.PENDING: 'PENDING',
  CommentReviewStateEnum.CLOSE: 'CLOSE',
};
