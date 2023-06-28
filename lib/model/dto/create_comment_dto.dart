import 'package:json_annotation/json_annotation.dart';

part 'create_comment_dto.g.dart';

/// CreateCommentDto
@JsonSerializable()
class CreateCommentDto {
  int postId;
  String content;

  CreateCommentDto({
    required this.postId,
    required this.content,
  });

  factory CreateCommentDto.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCommentDtoToJson(this);
}
