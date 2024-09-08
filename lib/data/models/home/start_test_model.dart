// To parse this JSON data, do
//
//     final testsModel = testsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'start_test_model.g.dart';

StartTestsModel startTestsModelFromJson(String str) =>
    StartTestsModel.fromJson(json.decode(str));

String startTestsModelToJson(StartTestsModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class StartTestsModel {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "data")
  final Data data;
  @JsonKey(name: "error")
  final dynamic error;

  const StartTestsModel({
    this.success = false,
    this.data = const Data(),
    this.error,
  });

  factory StartTestsModel.fromJson(Map<String, dynamic> json) =>
      _$StartTestsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StartTestsModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "tests")
  final List<Test> tests;

  const Data({
    this.tests = const [],
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Test {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "point")
  final int point;
  @JsonKey(name: "difficulty_level")
  final String difficultyLevel;
  @JsonKey(name: "answers")
  final List<Answer> answers;

  const Test({
    this.id = 0,
    this.title = '',
    this.point = 0,
    this.difficultyLevel = '',
    this.answers = const [],
  });

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}

@JsonSerializable()
class Answer {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;

  const Answer({
    this.id = 0,
    this.title = "",
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
