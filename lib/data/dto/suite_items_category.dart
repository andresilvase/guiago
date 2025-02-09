enum SuiteItemsCategoryDTOEnum { nome, icone }

class SuiteCategoriaItemsDTO {
  String? nome;
  String? icone;

  SuiteCategoriaItemsDTO({this.nome, this.icone});

  factory SuiteCategoriaItemsDTO.fromJson(Map<String, dynamic> json) {
    return SuiteCategoriaItemsDTO(
      icone: json[SuiteItemsCategoryDTOEnum.icone.name],
      nome: json[SuiteItemsCategoryDTOEnum.nome.name],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      SuiteItemsCategoryDTOEnum.icone.name: icone,
      SuiteItemsCategoryDTOEnum.nome.name: nome,
    };
  }
}
