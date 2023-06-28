import 'package:json_annotation/json_annotation.dart';

part 'create_child_reply_dto.g.dart';

/// CreateChildReplyDto
@JsonSerializable()
class CreateChildReplyDto {
  int parentReplyId;
  String content;

  CreateChildReplyDto({
    required this.parentReplyId,
    required this.content,
  });

  factory CreateChildReplyDto.fromJson(Map<String, dynamic> json) =>
      _$CreateChildReplyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateChildReplyDtoToJson(this);
}
