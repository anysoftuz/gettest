// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartTestsModel _$StartTestsModelFromJson(Map<String, dynamic> json) =>
    StartTestsModel(
      success: json['success'] as bool? ?? false,
      data: json['data'] == null
          ? const Data()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'],
    );

Map<String, dynamic> _$StartTestsModelToJson(StartTestsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      testSessionId: (json['test_session_id'] as num?)?.toInt() ?? 0,
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      tests: (json['tests'] as List<dynamic>?)
              ?.map((e) => Test.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'test_session_id': instance.testSessionId,
      'duration': instance.duration,
      'tests': instance.tests,
    };

Test _$TestFromJson(Map<String, dynamic> json) => Test(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      point: (json['point'] as num?)?.toInt() ?? 0,
      difficultyLevel: json['difficulty_level'] as String? ?? '',
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TestToJson(Test instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'point': instance.point,
      'difficulty_level': instance.difficultyLevel,
      'answers': instance.answers,
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? "",
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
