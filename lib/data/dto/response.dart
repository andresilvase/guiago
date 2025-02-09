import 'package:guiago/data/dto/data.dart';

enum PayloadResponseEnum { sucesso, data, mensagem }

class APIResponse {
  ResponseData? data;
  List? mensagem;
  bool? sucesso;

  APIResponse({this.sucesso, this.data, this.mensagem});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      mensagem: json[PayloadResponseEnum.mensagem.name],
      sucesso: json[PayloadResponseEnum.sucesso.name],
      data: json[PayloadResponseEnum.data.name],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      PayloadResponseEnum.data.name: data?.toJson(),
      PayloadResponseEnum.mensagem.name: mensagem,
      PayloadResponseEnum.sucesso.name: sucesso,
    };
  }
}
