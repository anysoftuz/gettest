class ExistBody {
  final String otpSessionId;
  final String phone;
  final String code;

  ExistBody({
    this.otpSessionId = "",
    this.phone = "",
    this.code = "",
  });

  factory ExistBody.fromJson(Map<String, dynamic> json) => ExistBody(
        otpSessionId: json["otp_session_id"],
        phone: json["phone"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "otp_session_id": otpSessionId,
        "phone": phone,
        "code": code,
      };
}
