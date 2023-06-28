import 'package:json_annotation/json_annotation.dart';

part 'create_parent_reply_dto.g.dart';

/// CreateParentReplyDto
@JsonSerializable()
class CreateParentReplyDto {
  int replyId;
  String content;

  CreateParentReplyDto({
    required this.replyId,
    required this.content,
  });

  factory CreateParentReplyDto.fromJson(Map<String, dynamic> json) =>
      _$CreateParentReplyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateParentReplyDtoToJson(this);
}
