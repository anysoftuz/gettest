// To parse this JSON data, do
//
//     final testsModel = testsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'tests_model.g.dart';

TestsModel testsModelFromJson(String str) =>
    TestsModel.fromJson(json.decode(str));

String testsModelToJson(TestsModel data) => json.encode(data.toJson());

@JsonSerializable()
class TestsModel {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "data")
  final Data data;
  @JsonKey(name: "error")
  final dynamic error;

  const TestsModel({
    this.success = false,
    this.data = const Data(),
    this.error,
  });

  factory TestsModel.fromJson(Map<String, dynamic> json) =>
      _$TestsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TestsModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "tests")
  final List<Test> tests;
  @JsonKey(name: "pagination")
  final Pagination pagination;

  const Data({
    this.tests = const [],
    this.pagination = const Pagination(),
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: "current_page")
  final int currentPage;
  @JsonKey(name: "per_page")
  final int perPage;
  @JsonKey(name: "has_more")
  final bool hasMore;
  @JsonKey(name: "items_count")
  final int itemsCount;
  @JsonKey(name: "total_count")
  final int totalCount;
  @JsonKey(name: "pages_count")
  final int pagesCount;

  const Pagination({
    this.currentPage = 0,
    this.perPage = 0,
    this.hasMore = false,
    this.itemsCount = 0,
    this.totalCount = 0,
    this.pagesCount = 0,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class Test {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "questions_count")
  final int questionsCount;
  @JsonKey(name: "total_points")
  final int totalPoints;
  @JsonKey(name: "passing_score")
  final int passingScore;
  @JsonKey(name: "attempts")
  final int attempts;
  @JsonKey(name: "duration")
  final int duration;
  @JsonKey(name: "is_hide_result")
  final bool isHideResult;
  @JsonKey(name: "status")
  final Status status;
  @JsonKey(name: "started_at")
  final String startedAt;
  @JsonKey(name: "started_at_formatted")
  final String startedAtFormatted;
  @JsonKey(name: "finished_at")
  final String finishedAt;
  @JsonKey(name: "finished_at_formatted")
  final String finishedAtFormatted;

  const Test({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.questionsCount = 0,
    this.totalPoints = 0,
    this.passingScore = 0,
    this.attempts = 0,
    this.duration = 0,
    this.isHideResult = false,
    this.status = const Status(),
    this.startedAt = "",
    this.startedAtFormatted = "",
    this.finishedAt = "",
    this.finishedAtFormatted = "",
  });

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}

@JsonSerializable()
class Status {
  @JsonKey(name: "label")
  final String label;
  @JsonKey(name: "value")
  final String value;
  @JsonKey(name: "color")
  final String color;
  @JsonKey(name: "text_color")
  final String textColor;

  const Status({
    this.label = "",
    this.value = "",
    this.color = "",
    this.textColor = "",
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
