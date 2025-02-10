import 'package:guiago/data/dto/suite_discount.dart';

enum SuitePeriodsDTOEnum { tempoFormatado, tempo, valor, valorTotal, temCortesia, desconto }

class SuitePeriodsDTO {
  SuiteDiscountDTO? desconto;
  String? tempoFormatado;
  double? valorTotal;
  bool? temCortesia;
  String? tempo;
  double? valor;

  SuitePeriodsDTO({
    this.tempoFormatado,
    this.temCortesia,
    this.valorTotal,
    this.desconto,
    this.tempo,
    this.valor,
  });

  factory SuitePeriodsDTO.fromJson(Map<String, dynamic> json) {
    return SuitePeriodsDTO(
      desconto: SuiteDiscountDTO.fromJson(json[SuitePeriodsDTOEnum.desconto.name] ?? {}),
      tempoFormatado: json[SuitePeriodsDTOEnum.tempoFormatado.name],
      temCortesia: json[SuitePeriodsDTOEnum.temCortesia.name],
      valorTotal: json[SuitePeriodsDTOEnum.valorTotal.name],
      tempo: json[SuitePeriodsDTOEnum.tempo.name],
      valor: json[SuitePeriodsDTOEnum.valor.name],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SuitePeriodsDTOEnum.desconto.name: desconto?.toJson(),
      SuitePeriodsDTOEnum.tempoFormatado.name: tempoFormatado,
      SuitePeriodsDTOEnum.temCortesia.name: temCortesia,
      SuitePeriodsDTOEnum.valorTotal.name: valorTotal,
      SuitePeriodsDTOEnum.tempo.name: tempo,
      SuitePeriodsDTOEnum.valor.name: valor,
    };
  }
}
