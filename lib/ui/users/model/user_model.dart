import 'dart:convert';

List<UserModel> userFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int id;
  String firstname;
  String lastname;
  String email;
  String avatar;

  UserModel(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.avatar
      });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        firstname: json["first_name"],
        lastname: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstname,
        "last_name": lastname,
        "avatar": avatar,
      };
}