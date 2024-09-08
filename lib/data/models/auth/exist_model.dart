// To parse this JSON data, do
//
//     final existModel = existModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'exist_model.g.dart';

ExistModel existModelFromJson(String str) =>
    ExistModel.fromJson(json.decode(str));

String existModelToJson(ExistModel data) => json.encode(data.toJson());

@JsonSerializable()
class ExistModel {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "data")
  final Data data;
  @JsonKey(name: "error")
  final dynamic error;

  ExistModel({
    this.success = false,
    this.data = const Data(),
    this.error,
  });

  factory ExistModel.fromJson(Map<String, dynamic> json) =>
      _$ExistModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExistModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "exists")
  final bool exists;
  @JsonKey(name: "token")
  final Token token;

  const Data({
    this.exists = false,
    this.token = const Token(),
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Token {
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "token_type")
  final String tokenType;
  @JsonKey(name: "expires_in")
  final int expiresIn;

  const Token({
    this.accessToken = '',
    this.tokenType = '',
    this.expiresIn = 0,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
