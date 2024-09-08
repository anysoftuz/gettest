class VerifyBody {
  final String authCode;
  final String externalId;
  final String comparisonValue;
  final String image;

  VerifyBody({
    this.authCode = "",
    this.externalId = "",
    this.comparisonValue = "",
    this.image = "",
  });

  factory VerifyBody.fromJson(Map<String, dynamic> json) => VerifyBody(
        authCode: json["auth_code"],
        externalId: json["external_id"],
        comparisonValue: json["comparison_value"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "auth_code": authCode,
        "external_id": externalId,
        "comparison_value": comparisonValue,
        "image": image,
      };
}
