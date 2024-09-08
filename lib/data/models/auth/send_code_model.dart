// To parse this JSON data, do
//
//     final sendCodeModel = sendCodeModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'send_code_model.g.dart';

SendCodeModel sendCodeModelFromJson(String str) =>
    SendCodeModel.fromJson(json.decode(str));

String sendCodeModelToJson(SendCodeModel data) => json.encode(data.toJson());

@JsonSerializable()
class SendCodeModel {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "data")
  final Data data;
  @JsonKey(name: "error")
  final dynamic error;

  SendCodeModel({
    this.success = false,
    this.data = const Data(),
    this.error,
  });

  factory SendCodeModel.fromJson(Map<String, dynamic> json) =>
      _$SendCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendCodeModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "otp")
  final Otp otp;
  @JsonKey(name: "otp_enabled")
  final bool otpEnabled;

const  Data({
    this.message = "",
    this.otp = const Otp(),
    this.otpEnabled = false,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Otp {
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "expires")
  final int expires;
  @JsonKey(name: "code_length")
  final int codeLength;
  @JsonKey(name: "input_type")
  final String inputType;
  @JsonKey(name: "session_id")
  final String sessionId;
  @JsonKey(name: "type")
  final String type;

  const Otp({
    this.phone = '',
    this.message = '',
    this.expires = 0,
    this.codeLength = 0,
    this.inputType = '',
    this.sessionId = '',
    this.type = '',
  });

  factory Otp.fromJson(Map<String, dynamic> json) => _$OtpFromJson(json);

  Map<String, dynamic> toJson() => _$OtpToJson(this);
}
