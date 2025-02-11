import 'package:guiago/data/dto/data.dart';

enum ResponseEnum { sucesso, data, mensagem }

class Response {
  ResponseData? data;
  List? mensagem;
  bool? sucesso;

  Response({this.sucesso, this.data, this.mensagem});

  factory Response.fromJson(Map<dynamic, dynamic> json) {
    return Response(
      data: ResponseData.fromJson(json[ResponseEnum.data.name]),
      mensagem: json[ResponseEnum.mensagem.name],
      sucesso: json[ResponseEnum.sucesso.name],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ResponseEnum.data.name: data?.toJson(),
      ResponseEnum.mensagem.name: mensagem,
      ResponseEnum.sucesso.name: sucesso,
    };
  }
}
