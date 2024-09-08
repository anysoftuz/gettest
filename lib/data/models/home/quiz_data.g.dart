// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizDataModel _$QuizDataModelFromJson(Map<String, dynamic> json) =>
    QuizDataModel(
      id: (json['id'] as num).toInt(),
      startedAt: json['startedAt'] as String,
      answeredAt: json['answeredAt'] as String,
      answerId: (json['answerId'] as num).toInt(),
    );

Map<String, dynamic> _$QuizDataModelToJson(QuizDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startedAt': instance.startedAt,
      'answeredAt': instance.answeredAt,
      'answerId': instance.answerId,
    };
