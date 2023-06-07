import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

/// UserEntity
@JsonSerializable()
class UserEntity {
  String? alias;

  UserEntity({
    this.alias,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
