import 'package:guiago/data/dto/motel.dart';

enum MotelDataEnum { qtdPorPagina, totalSuites, totalMoteis, maxPaginas, moteis, pagina, raio }

class ResponseData {
  List<MotelDTO> moteis;
  num? qtdPorPagina;
  num? totalSuites;
  num? totalMoteis;
  num? maxPaginas;
  num? pagina;
  num? raio;

  ResponseData({
    this.moteis = const [],
    this.qtdPorPagina,
    this.totalMoteis,
    this.totalSuites,
    this.maxPaginas,
    this.pagina,
    this.raio,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    final newMotelList = <MotelDTO>[];

    if (json[MotelDataEnum.moteis.name] != null) {
      json[MotelDataEnum.moteis.name].forEach((m) {
        newMotelList.add(MotelDTO.fromJson(m));
      });
    }

    return ResponseData(
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
      MotelDataEnum.moteis.name: moteis.map((m) => m.toJson()).toList(),
      MotelDataEnum.qtdPorPagina.name: qtdPorPagina,
      MotelDataEnum.totalSuites.name: totalSuites,
      MotelDataEnum.totalMoteis.name: totalMoteis,
      MotelDataEnum.maxPaginas.name: maxPaginas,
      MotelDataEnum.pagina.name: pagina,
      MotelDataEnum.raio.name: raio,
    };
  }
}
