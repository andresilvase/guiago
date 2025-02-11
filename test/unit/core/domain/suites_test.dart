import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/core/domain/suites.dart';

void main() {
  group('SuiteDiscount', () {
    test('should initialize with the correct values', () {
      // Arrange
      const desconto = 10.0;

      // Act
      final suiteDiscount = SuiteDiscount(desconto: desconto);

      // Assert
      expect(suiteDiscount.desconto, desconto);
    });

    test('should initialize with default values', () {
      // Act
      final suiteDiscount = SuiteDiscount();

      // Assert
      expect(suiteDiscount.desconto, isNull);
    });
  });

  group('SuiteCategoriaItem', () {
    test('should initialize with the correct values', () {
      // Arrange
      const nome = 'Categoria';
      const icone = 'icon.png';

      // Act
      final suiteCategoriaItem = SuiteCategoriaItem(nome: nome, icone: icone);

      // Assert
      expect(suiteCategoriaItem.nome, nome);
      expect(suiteCategoriaItem.icone, icone);
    });

    test('should initialize with default values', () {
      // Act
      final suiteCategoriaItem = SuiteCategoriaItem();

      // Assert
      expect(suiteCategoriaItem.nome, isNull);
      expect(suiteCategoriaItem.icone, isNull);
    });
  });

  group('SuiteItem', () {
    test('should initialize with the correct values', () {
      // Arrange
      const nome = 'Item';

      // Act
      final suiteItem = SuiteItem(nome: nome);

      // Assert
      expect(suiteItem.nome, nome);
    });

    test('should initialize with default values', () {
      // Act
      final suiteItem = SuiteItem();

      // Assert
      expect(suiteItem.nome, isNull);
    });
  });

  group('SuitePeriod', () {
    test('should initialize with the correct values', () {
      // Arrange
      final desconto = SuiteDiscount(desconto: 10.0);
      const tempoFormatado = '1h';
      const valorTotal = 100.0;
      const temCortesia = true;
      const tempo = '60min';
      const valor = 50.0;

      // Act
      final suitePeriod = SuitePeriod(
        desconto: desconto,
        tempoFormatado: tempoFormatado,
        valorTotal: valorTotal,
        temCortesia: temCortesia,
        tempo: tempo,
        valor: valor,
      );

      // Assert
      expect(suitePeriod.desconto, desconto);
      expect(suitePeriod.tempoFormatado, tempoFormatado);
      expect(suitePeriod.valorTotal, valorTotal);
      expect(suitePeriod.temCortesia, temCortesia);
      expect(suitePeriod.tempo, tempo);
      expect(suitePeriod.valor, valor);
    });

    test('should initialize with default values', () {
      // Act
      final suitePeriod = SuitePeriod();

      // Assert
      expect(suitePeriod.desconto, isNull);
      expect(suitePeriod.tempoFormatado, isNull);
      expect(suitePeriod.valorTotal, isNull);
      expect(suitePeriod.temCortesia, isNull);
      expect(suitePeriod.tempo, isNull);
      expect(suitePeriod.valor, isNull);
    });
  });

  group('Suites', () {
    test('should initialize with the correct values', () {
      // Arrange
      final categoriaItens = [SuiteCategoriaItem(nome: 'Categoria 1'), SuiteCategoriaItem(nome: 'Categoria 2')];
      const exibirQtdDisponiveis = true;
      final periodos = [SuitePeriod(tempoFormatado: '1h'), SuitePeriod(tempoFormatado: '2h')];
      final itens = [SuiteItem(nome: 'Item 1'), SuiteItem(nome: 'Item 2')];
      final fotos = ['foto1.jpg', 'foto2.jpg'];
      const nome = 'Suite';
      const qtd = 5;

      // Act
      final suites = Suites(
        categoriaItens: categoriaItens,
        exibirQtdDisponiveis: exibirQtdDisponiveis,
        periodos: periodos,
        itens: itens,
        fotos: fotos,
        nome: nome,
        qtd: qtd,
      );

      // Assert
      expect(suites.categoriaItens, categoriaItens);
      expect(suites.exibirQtdDisponiveis, exibirQtdDisponiveis);
      expect(suites.periodos, periodos);
      expect(suites.itens, itens);
      expect(suites.fotos, fotos);
      expect(suites.nome, nome);
      expect(suites.qtd, qtd);
    });

    test('should initialize with default values', () {
      // Act
      final suites = Suites();

      // Assert
      expect(suites.categoriaItens, isNull);
      expect(suites.exibirQtdDisponiveis, isNull);
      expect(suites.periodos, []);
      expect(suites.itens, []);
      expect(suites.fotos, isNull);
      expect(suites.nome, isNull);
      expect(suites.qtd, isNull);
    });
  });
}
