import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/data/dto/motel.dart';
import 'package:guiago/data/mappers/suite_mapper.dart';

class MotelMapper {
  static Motel fromDTO(MotelDTO dto) {
    return Motel(
      suites: dto.suites.map((s) => SuitesMapper.fromDTO(s)).toList(),
      qtdAvaliacoes: dto.qtdAvaliacoes,
      qtdFavoritos: dto.qtdFavoritos,
      distancia: dto.distancia,
      fantasia: dto.fantasia,
      bairro: dto.bairro,
      media: dto.media,
      logo: dto.logo,
    );
  }
}
