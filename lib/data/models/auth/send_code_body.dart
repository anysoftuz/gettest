class SendCodeBody {
  final String reason;
  final String phone;
  final String otpSessionId;

  SendCodeBody({
    this.reason = "auth",
    this.phone = "",
    this.otpSessionId = "",
  });

  factory SendCodeBody.fromJson(Map<String, dynamic> json) => SendCodeBody(
        reason: json["reason"],
        phone: json["phone"],
        otpSessionId: json["otp_session_id"],
      );

  Map<String, dynamic> toJson() => {
        "reason": reason,
        "phone": phone,
        "otp_session_id": otpSessionId,
      };
}
