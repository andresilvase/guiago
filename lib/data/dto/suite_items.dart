enum SuiteItemsEnum { nome, descricao, fotos, itens }

class SuiteItems {
  String? nome;

  SuiteItems({this.nome});

  SuiteItems.fromJson(Map<String, dynamic> json) {
    nome = json[SuiteItemsEnum.nome.name];
  }

  Map<String, dynamic> toJson() {
    return {SuiteItemsEnum.nome.name: nome};
  }
}
