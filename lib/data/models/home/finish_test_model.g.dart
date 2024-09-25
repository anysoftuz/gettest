// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finish_test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishTestModel _$FinishTestModelFromJson(Map<String, dynamic> json) =>
    FinishTestModel(
      testSessionId: (json['test_session_id'] as num?)?.toInt() ?? 0,
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$FinishTestModelToJson(FinishTestModel instance) =>
    <String, dynamic>{
      'test_session_id': instance.testSessionId,
      'questions': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      id: (json['id'] as num?)?.toInt() ?? 0,
      startedAt: json['started_at'] as String? ?? '',
      answeredAt: json['answered_at'] as String? ?? '',
      answerId: (json['answer_id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'id': instance.id,
      'started_at': instance.startedAt,
      'answered_at': instance.answeredAt,
      'answer_id': instance.answerId,
    };
