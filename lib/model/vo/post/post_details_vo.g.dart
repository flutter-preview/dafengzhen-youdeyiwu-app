// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_details_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDetailsVo _$PostDetailsVoFromJson(Map<String, dynamic> json) =>
    PostDetailsVo(
      state: json['state'] as String,
      reviewState: json['reviewState'] as String,
      sortState: json['sortState'] as String,
      otherStates: (json['otherStates'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      viewCount: json['viewCount'] as int,
      commentCount: json['commentCount'] as int,
      replyCount: json['replyCount'] as int,
      likeCount: json['likeCount'] as int,
      followCount: json['followCount'] as int,
      favoriteCount: json['favoriteCount'] as int,
      allow: (json['allow'] as List<dynamic>).map((e) => e as int).toList(),
      block: (json['block'] as List<dynamic>).map((e) => e as int).toList(),
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

Map<String, dynamic> _$PostDetailsVoToJson(PostDetailsVo instance) {
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
  val['state'] = instance.state;
  val['reviewState'] = instance.reviewState;
  val['sortState'] = instance.sortState;
  val['otherStates'] = instance.otherStates;
  val['viewCount'] = instance.viewCount;
  val['commentCount'] = instance.commentCount;
  val['replyCount'] = instance.replyCount;
  val['likeCount'] = instance.likeCount;
  val['followCount'] = instance.followCount;
  val['favoriteCount'] = instance.favoriteCount;
  val['allow'] = instance.allow;
  val['block'] = instance.block;
  return val;
}
