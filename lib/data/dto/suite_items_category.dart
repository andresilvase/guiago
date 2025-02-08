enum SuiteItemsCategoryEnum { nome, icone }

class SuiteCategoriaItems {
  String? nome;
  String? icone;

  SuiteCategoriaItems({this.nome, this.icone});

  factory SuiteCategoriaItems.fromJson(Map<String, dynamic> json) {
    return SuiteCategoriaItems(
      icone: json[SuiteItemsCategoryEnum.icone.name],
      nome: json[SuiteItemsCategoryEnum.nome.name],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SuiteItemsCategoryEnum.icone.name: icone,
      SuiteItemsCategoryEnum.nome.name: nome,
    };
  }
}
