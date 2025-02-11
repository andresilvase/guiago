enum SuiteItemsDTOEnum { nome, descricao, fotos, itens }

class SuiteItemsDTO {
  String? nome;

  SuiteItemsDTO({this.nome});

  SuiteItemsDTO.fromJson(Map<dynamic, dynamic> json) {
    nome = json[SuiteItemsDTOEnum.nome.name];
  }

  Map<String, dynamic> toJson() {
    return {SuiteItemsDTOEnum.nome.name: nome};
  }
}
