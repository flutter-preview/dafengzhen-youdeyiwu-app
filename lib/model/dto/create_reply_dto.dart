import 'package:json_annotation/json_annotation.dart';

part 'create_reply_dto.g.dart';

/// CreateReplyDto
@JsonSerializable()
class CreateReplyDto {
  int commentId;
  String content;

  CreateReplyDto({
    required this.commentId,
    required this.content,
  });

  factory CreateReplyDto.fromJson(Map<String, dynamic> json) =>
      _$CreateReplyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReplyDtoToJson(this);
}
