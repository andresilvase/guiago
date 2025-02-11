import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/data/dto/motel.dart';
import 'package:guiago/data/dto/suites.dart';
import 'package:guiago/data/mappers/motel_mapper.dart';

void main() {
  group('MotelMapper', () {
    test('fromDTO should correctly map MotelDTO to Motel', () {
      // Arrange
      final dto = MotelDTO(
        suites: [
          SuitesDTO(
            nome: 'Suite 1',
            qtd: 2,
            fotos: ['photo1.jpg', 'photo2.jpg'],
            exibirQtdDisponiveis: true,
            categoriaItens: [],
            periodos: [],
            itens: [],
          )
        ],
        qtdAvaliacoes: 10,
        qtdFavoritos: 20,
        distancia: 1.5,
        fantasia: 'Motel Test',
        bairro: 'Downtown',
        media: 4.5,
        logo: 'logo.jpg',
      );

      // Act
      final result = MotelMapper.fromDTO(dto);

      // Assert
      expect(result, isA<Motel>());
      expect(result.suites.length, dto.suites.length);
      expect(result.qtdAvaliacoes, dto.qtdAvaliacoes);
      expect(result.qtdFavoritos, dto.qtdFavoritos);
      expect(result.distancia, dto.distancia);
      expect(result.fantasia, dto.fantasia);
      expect(result.bairro, dto.bairro);
      expect(result.media, dto.media);
      expect(result.logo, dto.logo);
    });

    test('fromDTO should handle empty suites list', () {
      // Arrange
      final dto = MotelDTO(
        suites: [],
        qtdAvaliacoes: 10,
        qtdFavoritos: 20,
        distancia: 1.5,
        fantasia: 'Motel Test',
        bairro: 'Downtown',
        media: 4.5,
        logo: 'logo.jpg',
      );

      // Act
      final result = MotelMapper.fromDTO(dto);

      // Assert
      expect(result.suites, isEmpty);
    });

    test('fromDTO should handle null values', () {
      // Arrange
      final dto = MotelDTO(
        suites: [],
        qtdAvaliacoes: null,
        qtdFavoritos: null,
        distancia: null,
        fantasia: null,
        bairro: null,
        media: null,
        logo: null,
      );

      // Act
      final result = MotelMapper.fromDTO(dto);

      // Assert
      expect(result.qtdAvaliacoes, isNull);
      expect(result.qtdFavoritos, isNull);
      expect(result.distancia, isNull);
      expect(result.fantasia, isNull);
      expect(result.bairro, isNull);
      expect(result.media, isNull);
      expect(result.logo, isNull);
    });
  });
}
