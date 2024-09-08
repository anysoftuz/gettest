import 'package:json_annotation/json_annotation.dart';

part 'quiz_data.g.dart';

@JsonSerializable()
class QuizDataModel {
  int id;
  String startedAt;
  String answeredAt;
  int answerId;

  QuizDataModel({
    required this.id,
    required this.startedAt,
    required this.answeredAt,
    required this.answerId,
  });

  factory QuizDataModel.fromJson(Map<String, dynamic> json) =>
      _$QuizDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuizDataModelToJson(this);
}
