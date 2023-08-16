// To parse this JSON data, do
//
//     final signinResponse = signinResponseFromJson(jsonString);

import 'dart:convert';

SigninResponse signinResponseFromJson(String str) =>
    SigninResponse.fromJson(json.decode(str));

String signinResponseToJson(SigninResponse data) => json.encode(data.toJson());

class SigninResponse {
  String? accessToken;
  User? user;

  SigninResponse({
    this.accessToken,
    this.user,
  });

  factory SigninResponse.fromJson(Map<String, dynamic> json) => SigninResponse(
        accessToken: json["accessToken"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "user": user?.toJson(),
      };
}

class User {
  String? firstName;
  String? lastName;
  String? userName;
  String? email;

  User({
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        userName: json["user_name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "user_name": userName,
        "email": email,
      };
}
