import 'package:guiago/data/dto/suites.dart';

enum MoteisEnum { fantasia, logo, bairro, distancia, qtdFavoritos, suites, qtdAvaliacoes, media }

class Motel {
  List<Suites>? suites;
  int? qtdAvaliacoes;
  double? distancia;
  int? qtdFavoritos;
  String? fantasia;
  String? bairro;
  double? media;
  String? logo;

  Motel({
    this.qtdAvaliacoes,
    this.qtdFavoritos,
    this.distancia,
    this.fantasia,
    this.bairro,
    this.suites,
    this.media,
    this.logo,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    final newSuitesList = <Suites>[];

    if (json[MoteisEnum.suites.name] != null) {
      json[MoteisEnum.suites.name].forEach((s) {
        newSuitesList.add(Suites.fromJson(s));
      });
    }

    return Motel(
      qtdAvaliacoes: json[MoteisEnum.qtdAvaliacoes.name],
      qtdFavoritos: json[MoteisEnum.qtdFavoritos.name],
      distancia: json[MoteisEnum.distancia.name],
      fantasia: json[MoteisEnum.fantasia.name],
      bairro: json[MoteisEnum.bairro.name],
      media: json[MoteisEnum.media.name],
      logo: json[MoteisEnum.logo.name],
      suites: newSuitesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      MoteisEnum.suites.name: suites?.map((s) => s.toJson()).toList(),
      MoteisEnum.qtdAvaliacoes.name: qtdAvaliacoes,
      MoteisEnum.qtdFavoritos.name: qtdFavoritos,
      MoteisEnum.distancia.name: distancia,
      MoteisEnum.fantasia.name: fantasia,
      MoteisEnum.bairro.name: bairro,
      MoteisEnum.media.name: media,
      MoteisEnum.logo.name: logo,
    };
  }
}
