import 'package:guiago/data/dto/suite_items_category.dart';
import 'package:guiago/data/dto/suite_periods.dart';
import 'package:guiago/data/dto/suite_items.dart';

enum SuitesDTOEnum { nome, qtd, exibirQtdDisponiveis, fotos, itens, categoriaItens, periodos }

class SuitesDTO {
  List<SuiteCategoriaItemsDTO>? categoriaItens;
  bool? exibirQtdDisponiveis;
  List<SuitePeriodsDTO> periodos;
  List<SuiteItemsDTO> itens;
  List<String>? fotos;
  String? nome;
  int? qtd;

  SuitesDTO({
    this.exibirQtdDisponiveis,
    this.periodos = const [],
    this.itens = const [],
    this.categoriaItens,
    this.fotos,
    this.nome,
    this.qtd,
  });

  factory SuitesDTO.fromJson(Map<String, dynamic> json) {
    final newCategoriaItensList = <SuiteCategoriaItemsDTO>[];
    final newPeriodosList = <SuitePeriodsDTO>[];
    final newItensList = <SuiteItemsDTO>[];

    if (json[SuitesDTOEnum.categoriaItens.name] != null) {
      json[SuitesDTOEnum.categoriaItens.name].forEach((s) {
        newCategoriaItensList.add(SuiteCategoriaItemsDTO.fromJson(s));
      });
    }

    if (json[SuitesDTOEnum.periodos.name] != null) {
      json[SuitesDTOEnum.periodos.name].forEach((s) {
        newPeriodosList.add(SuitePeriodsDTO.fromJson(s));
      });
    }

    if (json[SuitesDTOEnum.itens.name] != null) {
      json[SuitesDTOEnum.itens.name].forEach((s) {
        newItensList.add(SuiteItemsDTO.fromJson(s));
      });
    }

    return SuitesDTO(
      exibirQtdDisponiveis: json[SuitesDTOEnum.exibirQtdDisponiveis.name],
      fotos: List.from(json[SuitesDTOEnum.fotos.name]),
      categoriaItens: newCategoriaItensList,
      nome: json[SuitesDTOEnum.nome.name],
      qtd: json[SuitesDTOEnum.qtd.name],
      periodos: newPeriodosList,
      itens: newItensList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SuitesDTOEnum.categoriaItens.name: categoriaItens?.map((s) => s.toJson()).toList(),
      SuitesDTOEnum.periodos.name: periodos.map((s) => s.toJson()).toList(),
      SuitesDTOEnum.itens.name: itens.map((s) => s.toJson()).toList(),
      SuitesDTOEnum.exibirQtdDisponiveis.name: exibirQtdDisponiveis,
      SuitesDTOEnum.fotos.name: fotos,
      SuitesDTOEnum.nome.name: nome,
      SuitesDTOEnum.qtd.name: qtd,
    };
  }
}
