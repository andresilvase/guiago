class SuiteDiscount {
  double? desconto;

  SuiteDiscount({this.desconto});
}

class SuiteCategoriaItem {
  String? nome;
  String? icone;

  SuiteCategoriaItem({this.nome, this.icone});
}

class SuiteItem {
  String? nome;

  SuiteItem({this.nome});
}

class SuitePeriod {
  SuiteDiscount? desconto;
  String? tempoFormatado;
  double? valorTotal;
  bool? temCortesia;
  String? tempo;
  double? valor;

  SuitePeriod({
    this.tempoFormatado,
    this.temCortesia,
    this.valorTotal,
    this.desconto,
    this.tempo,
    this.valor,
  });
}

class Suites {
  List<SuiteCategoriaItem>? categoriaItens;
  bool? exibirQtdDisponiveis;
  List<SuitePeriod> periodos;
  List<SuiteItem> itens;
  List<String>? fotos;
  String? nome;
  int? qtd;

  Suites({
    this.exibirQtdDisponiveis,
    this.periodos = const [],
    this.itens = const [],
    this.categoriaItens,
    this.fotos,
    this.nome,
    this.qtd,
  });
}
