class UserLoginResponseModel {
  User? data;

  UserLoginResponseModel({
    this.data,
  });

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseModel(
        data: User.fromJson(json["data"]),
      );
}

class User {
  String? alias;

  User({
    this.alias,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        alias: json["alias"],
      );

  Map<String, dynamic> toJson() => {
        "alias": alias,
      };
}
