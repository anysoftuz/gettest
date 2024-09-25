// To parse this JSON data, do
//
//     final finishTestModel = finishTestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'finish_test_model.g.dart';

FinishTestModel finishTestModelFromJson(String str) =>
    FinishTestModel.fromJson(json.decode(str));

String finishTestModelToJson(FinishTestModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class FinishTestModel {
  @JsonKey(name: "test_session_id")
  final int testSessionId;
  @JsonKey(name: "questions")
  final List<Question> questions;

  FinishTestModel({
    this.testSessionId = 0,
    this.questions = const [],
  });

  factory FinishTestModel.fromJson(Map<String, dynamic> json) =>
      _$FinishTestModelFromJson(json);

  Map<String, dynamic> toJson() => _$FinishTestModelToJson(this);
}

@JsonSerializable()
class Question {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "started_at")
  final String startedAt;
  @JsonKey(name: "answered_at")
  final String answeredAt;
  @JsonKey(name: "answer_id")
  final int answerId;

  Question({
    this.id = 0,
    this.startedAt = '',
    this.answeredAt = '',
    this.answerId = 0,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
