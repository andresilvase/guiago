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
  List<SuiteCategoriaItem>? categoriaItens;
  bool? exibirQtdDisponiveis;
  List<SuitePeriods>? periodos;
  List<SuiteItem>? itens;
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
