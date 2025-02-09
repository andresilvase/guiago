enum EnumDiscountDTO { desconto }

class SuiteDiscountDTO {
  double? desconto;

  SuiteDiscountDTO({this.desconto});

  factory SuiteDiscountDTO.fromJson(Map<String, dynamic> json) {
    return SuiteDiscountDTO(
      desconto: json[EnumDiscountDTO.desconto.name],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      EnumDiscountDTO.desconto.name: desconto,
    };
  }
}
