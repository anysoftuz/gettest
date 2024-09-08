// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExistModel _$ExistModelFromJson(Map<String, dynamic> json) => ExistModel(
      success: json['success'] as bool? ?? false,
      data: json['data'] == null
          ? const Data()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'],
    );

Map<String, dynamic> _$ExistModelToJson(ExistModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      exists: json['exists'] as bool? ?? false,
      token: json['token'] == null
          ? const Token()
          : Token.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'exists': instance.exists,
      'token': instance.token,
    };

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      accessToken: json['access_token'] as String? ?? '',
      tokenType: json['token_type'] as String? ?? '',
      expiresIn: (json['expires_in'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
    };
