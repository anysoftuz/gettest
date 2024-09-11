class VerifyBody {
  final String code;
  final String externalId;
  final String comparisonValue;
  final String image;

  VerifyBody({
    this.code = "",
    this.externalId = "",
    this.comparisonValue = "",
    this.image = "",
  });

  factory VerifyBody.fromJson(Map<String, dynamic> json) => VerifyBody(
        code: json["code"],
        externalId: json["external_id"],
        comparisonValue: json["comparison_value"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "external_id": externalId,
        "comparison_value": comparisonValue,
        "image": image,
      };
}
