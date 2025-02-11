import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/data/dto/motel.dart';
import 'package:guiago/data/dto/suite_discount.dart';
import 'package:guiago/data/dto/suite_items.dart';
import 'package:guiago/data/dto/suite_items_category.dart';
import 'package:guiago/data/dto/suite_periods.dart';
import 'package:guiago/data/dto/suites.dart';
import 'package:guiago/data/mappers/motel_mapper.dart';

void main() {
  group('MotelMapper', () {
    test('fromDTO maps MotelDTO to Motel correctly', () {
      // Arrange
      final dto = MotelDTO(
        suites: [
          SuitesDTO(
            categoriaItens: [
              SuiteCategoriaItemsDTO(nome: 'Category 1', icone: 'icon1'),
            ],
            periodos: [
              SuitePeriodsDTO(
                desconto: SuiteDiscountDTO(desconto: 10),
                tempoFormatado: '1 hour',
                valorTotal: 100.0,
                temCortesia: true,
                tempo: "60",
                valor: 90.0,
              ),
            ],
            itens: [
              SuiteItemsDTO(nome: 'Item 1'),
            ],
            exibirQtdDisponiveis: true,
            fotos: ['photo1.jpg'],
            nome: 'Suite 1',
            qtd: 5,
          ),
        ],
        qtdAvaliacoes: 100,
        qtdFavoritos: 50,
        distancia: 5.0,
        fantasia: 'Fantasy Motel',
        bairro: 'Downtown',
        media: 4.5,
        logo: 'logo.png',
      );

      // Act
      final result = MotelMapper.fromDTO(dto);

      // Assert
      expect(result.suites.length, 1);
      expect(result.suites[0].nome, 'Suite 1');
      expect(result.suites[0].categoriaItens?.length, 1);
      expect(result.suites[0].categoriaItens?[0].nome, 'Category 1');
      expect(result.suites[0].periodos.length, 1);
      expect(result.suites[0].periodos[0].desconto?.desconto, 10);
      expect(result.suites[0].itens.length, 1);
      expect(result.suites[0].itens[0].nome, 'Item 1');
      expect(result.qtdAvaliacoes, 100);
      expect(result.qtdFavoritos, 50);
      expect(result.distancia, 5.0);
      expect(result.fantasia, 'Fantasy Motel');
      expect(result.bairro, 'Downtown');
      expect(result.media, 4.5);
      expect(result.logo, 'logo.png');
    });

    test('fromDTO handles empty suites list correctly', () {
      // Arrange
      final dto = MotelDTO(
        suites: [],
        qtdAvaliacoes: 100,
        qtdFavoritos: 50,
        distancia: 5.0,
        fantasia: 'Fantasy Motel',
        bairro: 'Downtown',
        media: 4.5,
        logo: 'logo.png',
      );

      // Act
      final result = MotelMapper.fromDTO(dto);

      // Assert
      expect(result.suites.isEmpty, true);
      expect(result.qtdAvaliacoes, 100);
      expect(result.qtdFavoritos, 50);
      expect(result.distancia, 5.0);
      expect(result.fantasia, 'Fantasy Motel');
      expect(result.bairro, 'Downtown');
      expect(result.media, 4.5);
      expect(result.logo, 'logo.png');
    });

    test('fromDTO handles nullable fields correctly', () {
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
      expect(result.suites.isEmpty, true);
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
