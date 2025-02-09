class SuiteDiscount {
  double? desconto;

  SuiteDiscount({this.desconto});
}

class SuiteCategoriaItems {
  String? nome;
  String? icone;

  SuiteCategoriaItems({this.nome, this.icone});
}

class SuiteItems {
  String? nome;

  SuiteItems({this.nome});
}

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
}

class Suites {
  List<SuiteCategoriaItems>? categoriaItens;
  bool? exibirQtdDisponiveis;
  List<SuitePeriods>? periodos;
  List<SuiteItems>? itens;
  List<String>? fotos;
  String? nome;
  int? qtd;

  Suites({
    this.exibirQtdDisponiveis,
    this.categoriaItens,
    this.periodos,
    this.fotos,
    this.itens,
    this.nome,
    this.qtd,
  });
}
