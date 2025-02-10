import 'package:guiago/data/dto/suites.dart';

enum MotelDTOEnum { fantasia, logo, bairro, distancia, qtdFavoritos, suites, qtdAvaliacoes, media }

class MotelDTO {
  List<SuitesDTO> suites;
  int? qtdAvaliacoes;
  double? distancia;
  int? qtdFavoritos;
  String? fantasia;
  String? bairro;
  double? media;
  String? logo;

  MotelDTO({
    this.suites = const [],
    this.qtdAvaliacoes,
    this.qtdFavoritos,
    this.distancia,
    this.fantasia,
    this.bairro,
    this.media,
    this.logo,
  });

  factory MotelDTO.fromJson(Map<String, dynamic> json) {
    final newSuitesList = <SuitesDTO>[];

    if (json[MotelDTOEnum.suites.name] != null) {
      json[MotelDTOEnum.suites.name].forEach((s) {
        newSuitesList.add(SuitesDTO.fromJson(s));
      });
    }

    return MotelDTO(
      qtdAvaliacoes: json[MotelDTOEnum.qtdAvaliacoes.name],
      qtdFavoritos: json[MotelDTOEnum.qtdFavoritos.name],
      distancia: json[MotelDTOEnum.distancia.name],
      fantasia: json[MotelDTOEnum.fantasia.name],
      bairro: json[MotelDTOEnum.bairro.name],
      media: json[MotelDTOEnum.media.name],
      logo: json[MotelDTOEnum.logo.name],
      suites: newSuitesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      MotelDTOEnum.suites.name: suites.map((s) => s.toJson()).toList(),
      MotelDTOEnum.qtdAvaliacoes.name: qtdAvaliacoes,
      MotelDTOEnum.qtdFavoritos.name: qtdFavoritos,
      MotelDTOEnum.distancia.name: distancia,
      MotelDTOEnum.fantasia.name: fantasia,
      MotelDTOEnum.bairro.name: bairro,
      MotelDTOEnum.media.name: media,
      MotelDTOEnum.logo.name: logo,
    };
  }
}
