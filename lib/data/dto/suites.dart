import 'package:guiago/data/dto/suite_items_category.dart';
import 'package:guiago/data/dto/suite_periods.dart';
import 'package:guiago/data/dto/suite_items.dart';

enum SuitesEnum { nome, qtd, exibirQtdDisponiveis, fotos, itens, categoriaItens, periodos }

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

  factory Suites.fromJson(Map<String, dynamic> json) {
    final newCategoriaItensList = <SuiteCategoriaItems>[];
    final newPeriodosList = <SuitePeriods>[];
    final newItensList = <SuiteItems>[];

    if (json[SuitesEnum.categoriaItens.name] != null) {
      json[SuitesEnum.categoriaItens.name].forEach((s) {
        newCategoriaItensList.add(SuiteCategoriaItems.fromJson(s));
      });
    }

    if (json[SuitesEnum.periodos.name] != null) {
      json[SuitesEnum.periodos.name].forEach((s) {
        newPeriodosList.add(SuitePeriods.fromJson(s));
      });
    }

    if (json[SuitesEnum.itens.name] != null) {
      json[SuitesEnum.itens.name].forEach((s) {
        newItensList.add(SuiteItems.fromJson(s));
      });
    }

    return Suites(
      exibirQtdDisponiveis: json[SuitesEnum.exibirQtdDisponiveis.name],
      categoriaItens: newCategoriaItensList,
      fotos: json[SuitesEnum.fotos.name],
      nome: json[SuitesEnum.nome.name],
      qtd: json[SuitesEnum.qtd.name],
      periodos: newPeriodosList,
      itens: newItensList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SuitesEnum.categoriaItens.name: categoriaItens?.map((s) => s.toJson()).toList(),
      SuitesEnum.periodos.name: periodos?.map((s) => s.toJson()).toList(),
      SuitesEnum.itens.name: itens?.map((s) => s.toJson()).toList(),
      SuitesEnum.exibirQtdDisponiveis.name: exibirQtdDisponiveis,
      SuitesEnum.fotos.name: fotos,
      SuitesEnum.nome.name: nome,
      SuitesEnum.qtd.name: qtd,
    };
  }
}
