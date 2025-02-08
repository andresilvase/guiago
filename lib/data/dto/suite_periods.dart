import 'package:guiago/data/dto/suite_discount.dart';

enum SuitePeriodsEnum { tempoFormatado, tempo, valor, valorTotal, temCortesia, desconto }

class SuitePeriods {
  SuiteDiscount? desconto;
  String? tempoFormatado;
  double? valorTotal;
  bool? temCortesia;
  String? tempo;
  double? valor;

  SuitePeriods({
    this.tempoFormatado,
    this.temCortesia,
    this.valorTotal,
    this.desconto,
    this.tempo,
    this.valor,
  });

  factory SuitePeriods.fromJson(Map<String, dynamic> json) {
    return SuitePeriods(
      desconto: SuiteDiscount.fromJson(json[SuitePeriodsEnum.desconto.name]),
      tempoFormatado: json[SuitePeriodsEnum.tempoFormatado.name],
      temCortesia: json[SuitePeriodsEnum.temCortesia.name],
      valorTotal: json[SuitePeriodsEnum.valorTotal.name],
      tempo: json[SuitePeriodsEnum.tempo.name],
      valor: json[SuitePeriodsEnum.valor.name],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SuitePeriodsEnum.desconto.name: desconto?.toJson(),
      SuitePeriodsEnum.tempoFormatado.name: tempoFormatado,
      SuitePeriodsEnum.temCortesia.name: temCortesia,
      SuitePeriodsEnum.valorTotal.name: valorTotal,
      SuitePeriodsEnum.tempo.name: tempo,
      SuitePeriodsEnum.valor.name: valor,
    };
  }
}
