import 'package:guiago/core/domain/suites.dart';

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
}
