// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCodeModel _$SendCodeModelFromJson(Map<String, dynamic> json) =>
    SendCodeModel(
      success: json['success'] as bool? ?? false,
      data: json['data'] == null
          ? const Data()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'],
    );

Map<String, dynamic> _$SendCodeModelToJson(SendCodeModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      message: json['message'] as String? ?? "",
      otp: json['otp'] == null
          ? const Otp()
          : Otp.fromJson(json['otp'] as Map<String, dynamic>),
      otpEnabled: json['otp_enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'message': instance.message,
      'otp': instance.otp,
      'otp_enabled': instance.otpEnabled,
    };

Otp _$OtpFromJson(Map<String, dynamic> json) => Otp(
      phone: json['phone'] as String? ?? '',
      message: json['message'] as String? ?? '',
      expires: (json['expires'] as num?)?.toInt() ?? 0,
      codeLength: (json['code_length'] as num?)?.toInt() ?? 0,
      inputType: json['input_type'] as String? ?? '',
      sessionId: json['session_id'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$OtpToJson(Otp instance) => <String, dynamic>{
      'phone': instance.phone,
      'message': instance.message,
      'expires': instance.expires,
      'code_length': instance.codeLength,
      'input_type': instance.inputType,
      'session_id': instance.sessionId,
      'type': instance.type,
    };
