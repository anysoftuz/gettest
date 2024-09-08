// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@JsonSerializable()
class UserModel {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "data")
  final Data data;
  @JsonKey(name: "error")
  final dynamic error;

  const UserModel({
    this.success = false,
    this.data = const Data(),
    this.error,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "user")
  final User user;

  const Data({this.user = const User()});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "surname")
  final String surname;
  @JsonKey(name: "patronymic")
  final dynamic patronymic;
  @JsonKey(name: "is_identified")
  final bool isIdentified;
  @JsonKey(name: "avatar")
  final String avatar;
  @JsonKey(name: "organizations")
  final List<Organization> organizations;

  const User({
    this.id = 0,
    this.phone = "",
    this.name = "",
    this.surname = "",
    this.patronymic = "",
    this.isIdentified = false,
    this.avatar = "",
    this.organizations = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Organization {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;

  const Organization({
    this.id = 0,
    this.name = "",
  });

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
