// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestsModel _$TestsModelFromJson(Map<String, dynamic> json) => TestsModel(
      success: json['success'] as bool? ?? false,
      data: json['data'] == null
          ? const Data()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'],
    );

Map<String, dynamic> _$TestsModelToJson(TestsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      tests: (json['tests'] as List<dynamic>?)
              ?.map((e) => Test.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pagination: json['pagination'] == null
          ? const Pagination()
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'tests': instance.tests,
      'pagination': instance.pagination,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 0,
      perPage: (json['per_page'] as num?)?.toInt() ?? 0,
      hasMore: json['has_more'] as bool? ?? false,
      itemsCount: (json['items_count'] as num?)?.toInt() ?? 0,
      totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
      pagesCount: (json['pages_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'has_more': instance.hasMore,
      'items_count': instance.itemsCount,
      'total_count': instance.totalCount,
      'pages_count': instance.pagesCount,
    };

Test _$TestFromJson(Map<String, dynamic> json) => Test(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      questionsCount: (json['questions_count'] as num?)?.toInt() ?? 0,
      totalPoints: (json['total_points'] as num?)?.toInt() ?? 0,
      passingScore: (json['passing_score'] as num?)?.toInt() ?? 0,
      attempts: (json['attempts'] as num?)?.toInt() ?? 0,
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      isHideResult: json['is_hide_result'] as bool? ?? false,
      status: json['status'] == null
          ? const Status()
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      startedAt: json['started_at'] as String? ?? "",
      startedAtFormatted: json['started_at_formatted'] as String? ?? "",
      finishedAt: json['finished_at'] as String? ?? "",
      finishedAtFormatted: json['finished_at_formatted'] as String? ?? "",
    );

Map<String, dynamic> _$TestToJson(Test instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'questions_count': instance.questionsCount,
      'total_points': instance.totalPoints,
      'passing_score': instance.passingScore,
      'attempts': instance.attempts,
      'duration': instance.duration,
      'is_hide_result': instance.isHideResult,
      'status': instance.status,
      'started_at': instance.startedAt,
      'started_at_formatted': instance.startedAtFormatted,
      'finished_at': instance.finishedAt,
      'finished_at_formatted': instance.finishedAtFormatted,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      label: json['label'] as String? ?? "",
      value: json['value'] as String? ?? "",
      color: json['color'] as String? ?? "",
      textColor: json['text_color'] as String? ?? "",
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'color': instance.color,
      'text_color': instance.textColor,
    };
