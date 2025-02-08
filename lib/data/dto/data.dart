import 'package:guiago/data/dto/motel.dart';

enum MotelDataEnum { qtdPorPagina, totalSuites, totalMoteis, maxPaginas, moteis, pagina, raio }

class MotelData {
  List<Moteis>? moteis;
  int? qtdPorPagina;
  int? totalSuites;
  int? totalMoteis;
  int? maxPaginas;
  int? pagina;
  int? raio;

  MotelData({
    this.qtdPorPagina,
    this.totalMoteis,
    this.totalSuites,
    this.maxPaginas,
    this.moteis,
    this.pagina,
    this.raio,
  });

  factory MotelData.fromJson(Map<String, dynamic> json) {
    final newMotelList = <Moteis>[];

    if (json[MotelDataEnum.moteis.name] != null) {
      json[MotelDataEnum.moteis.name].forEach((m) {
        newMotelList.add(Moteis.fromJson(m));
      });
    }

    return MotelData(
      qtdPorPagina: json[MotelDataEnum.qtdPorPagina.name],
      totalSuites: json[MotelDataEnum.totalSuites.name],
      totalMoteis: json[MotelDataEnum.totalMoteis.name],
      maxPaginas: json[MotelDataEnum.maxPaginas.name],
      pagina: json[MotelDataEnum.pagina.name],
      raio: json[MotelDataEnum.raio.name],
      moteis: newMotelList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      MotelDataEnum.moteis.name: moteis?.map((m) => m.toJson()).toList(),
      MotelDataEnum.qtdPorPagina.name: qtdPorPagina,
      MotelDataEnum.totalSuites.name: totalSuites,
      MotelDataEnum.totalMoteis.name: totalMoteis,
      MotelDataEnum.maxPaginas.name: maxPaginas,
      MotelDataEnum.pagina.name: pagina,
      MotelDataEnum.raio.name: raio,
    };
  }
}
