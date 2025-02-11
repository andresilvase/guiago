import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/core/domain/suites.dart';
import 'package:guiago/data/dto/suite_discount.dart';
import 'package:guiago/data/dto/suite_items.dart';
import 'package:guiago/data/dto/suite_items_category.dart';
import 'package:guiago/data/dto/suite_periods.dart';
import 'package:guiago/data/dto/suites.dart';
import 'package:guiago/data/mappers/suite_mapper.dart';

void main() {
  group('SuitesMapper', () {
    test('fromDTO maps SuitesDTO to Suites correctly', () {
      // Arrange
      final dto = SuitesDTO(
        categoriaItens: [
          SuiteCategoriaItemsDTO(nome: 'Category 1', icone: 'icon1'),
          SuiteCategoriaItemsDTO(nome: 'Category 2', icone: 'icon2'),
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
          SuiteItemsDTO(nome: 'Item 2'),
        ],
        exibirQtdDisponiveis: true,
        fotos: ['photo1.jpg', 'photo2.jpg'],
        nome: 'Suite 1',
        qtd: 5,
      );

      // Act
      final result = SuitesMapper.fromDTO(dto);

      // Assert
      expect(result.categoriaItens?.length, 2);
      expect(result.categoriaItens?[0].nome, 'Category 1');
      expect(result.categoriaItens?[0].icone, 'icon1');
      expect(result.periodos.length, 1);
      expect(result.periodos[0].desconto?.desconto, 10);
      expect(result.periodos[0].tempoFormatado, '1 hour');
      expect(result.itens.length, 2);
      expect(result.itens[0].nome, 'Item 1');
      expect(result.exibirQtdDisponiveis, true);
      expect(result.fotos, ['photo1.jpg', 'photo2.jpg']);
      expect(result.nome, 'Suite 1');
      expect(result.qtd, 5);
    });

    test('toDTO maps Suites to SuitesDTO correctly', () {
      // Arrange
      final domain = Suites(
        categoriaItens: [
          SuiteCategoriaItem(nome: 'Category 1', icone: 'icon1'),
          SuiteCategoriaItem(nome: 'Category 2', icone: 'icon2'),
        ],
        periodos: [
          SuitePeriod(
            desconto: SuiteDiscount(desconto: 10),
            tempoFormatado: '1 hour',
            valorTotal: 100.0,
            temCortesia: true,
            tempo: "60",
            valor: 90.0,
          ),
        ],
        itens: [
          SuiteItem(nome: 'Item 1'),
          SuiteItem(nome: 'Item 2'),
        ],
        exibirQtdDisponiveis: true,
        fotos: ['photo1.jpg', 'photo2.jpg'],
        nome: 'Suite 1',
        qtd: 5,
      );

      // Act
      final result = SuitesMapper.toDTO(domain);

      // Assert
      expect(result.categoriaItens?.length, 2);
      expect(result.categoriaItens?[0].nome, 'Category 1');
      expect(result.categoriaItens?[0].icone, 'icon1');
      expect(result.periodos.length, 1);
      expect(result.periodos[0].desconto?.desconto, 10);
      expect(result.periodos[0].tempoFormatado, '1 hour');
      expect(result.itens.length, 2);
      expect(result.itens[0].nome, 'Item 1');
      expect(result.exibirQtdDisponiveis, true);
      expect(result.fotos, ['photo1.jpg', 'photo2.jpg']);
      expect(result.nome, 'Suite 1');
      expect(result.qtd, 5);
    });

    test('suiteCategoriaItemsFromDTO maps SuiteCategoriaItemsDTO to SuiteCategoriaItem correctly', () {
      // Arrange
      final dto = SuiteCategoriaItemsDTO(nome: 'Category 1', icone: 'icon1');

      // Act
      final result = SuitesMapper.suiteCategoriaItemsFromDTO(dto);

      // Assert
      expect(result.nome, 'Category 1');
      expect(result.icone, 'icon1');
    });

    test('suiteItemsFromDTO maps SuiteItemsDTO to SuiteItem correctly', () {
      // Arrange
      final dto = SuiteItemsDTO(nome: 'Item 1');

      // Act
      final result = SuitesMapper.suiteItemsFromDTO(dto);

      // Assert
      expect(result.nome, 'Item 1');
    });

    test('suitePeriodsFromDTO maps SuitePeriodsDTO to SuitePeriod correctly', () {
      // Arrange
      final dto = SuitePeriodsDTO(
        desconto: SuiteDiscountDTO(desconto: 10),
        tempoFormatado: '1 hour',
        valorTotal: 100.0,
        temCortesia: true,
        tempo: "60",
        valor: 90.0,
      );

      // Act
      final result = SuitesMapper.suitePeriodsFromDTO(dto);

      // Assert
      expect(result.desconto?.desconto, 10);
      expect(result.tempoFormatado, '1 hour');
      expect(result.valorTotal, 100.0);
      expect(result.temCortesia, true);
      expect(result.tempo, "60");
      expect(result.valor, 90.0);
    });

    test('suiteDiscountFromDTO maps SuiteDiscountDTO to SuiteDiscount correctly', () {
      // Arrange
      final dto = SuiteDiscountDTO(desconto: 10);

      // Act
      final result = SuitesMapper.suiteDiscountFromDTO(dto);

      // Assert
      expect(result.desconto, 10);
    });

    test('suiteCategoriaItemsToDTO maps SuiteCategoriaItem to SuiteCategoriaItemsDTO correctly', () {
      // Arrange
      final domain = SuiteCategoriaItem(nome: 'Category 1', icone: 'icon1');

      // Act
      final result = SuitesMapper.suiteCategoriaItemsToDTO(domain);

      // Assert
      expect(result.nome, 'Category 1');
      expect(result.icone, 'icon1');
    });

    test('suiteItemsToDTO maps SuiteItem to SuiteItemsDTO correctly', () {
      // Arrange
      final domain = SuiteItem(nome: 'Item 1');

      // Act
      final result = SuitesMapper.suiteItemsToDTO(domain);

      // Assert
      expect(result.nome, 'Item 1');
    });

    test('suitePeriodsToDTO maps SuitePeriod to SuitePeriodsDTO correctly', () {
      // Arrange
      final domain = SuitePeriod(
        desconto: SuiteDiscount(desconto: 10),
        tempoFormatado: '1 hour',
        valorTotal: 100.0,
        temCortesia: true,
        tempo: "60",
        valor: 90.0,
      );

      // Act
      final result = SuitesMapper.suitePeriodsToDTO(domain);

      // Assert
      expect(result.desconto?.desconto, 10);
      expect(result.tempoFormatado, '1 hour');
      expect(result.valorTotal, 100.0);
      expect(result.temCortesia, true);
      expect(result.tempo, "60");
      expect(result.valor, 90.0);
    });

    test('suiteDiscountToDTO maps SuiteDiscount to SuiteDiscountDTO correctly', () {
      // Arrange
      final domain = SuiteDiscount(desconto: 10);

      // Act
      final result = SuitesMapper.suiteDiscountToDTO(domain);

      // Assert
      expect(result.desconto, 10);
    });
  });
}
