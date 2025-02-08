enum EnumDiscount { desconto }

class SuiteDiscount {
  double? desconto;

  SuiteDiscount({this.desconto});

  factory SuiteDiscount.fromJson(Map<String, dynamic> json) {
    return SuiteDiscount(
      desconto: json[EnumDiscount.desconto.name],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      EnumDiscount.desconto.name: desconto,
    };
  }
}
