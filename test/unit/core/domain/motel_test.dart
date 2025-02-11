import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/core/domain/suites.dart';

void main() {
  group('Motel', () {
    test('should initialize with the correct values', () {
      // Arrange
      final suites = [Suites(), Suites()];
      const qtdAvaliacoes = 10;
      const distancia = 5.5;
      const qtdFavoritos = 20;
      const fantasia = 'Motel Fantasia';
      const bairro = 'Bairro Central';
      const media = 4.5;
      const logo = 'https://example.com/logo.jpg';

      // Act
      final motel = Motel(
        suites: suites,
        qtdAvaliacoes: qtdAvaliacoes,
        distancia: distancia,
        qtdFavoritos: qtdFavoritos,
        fantasia: fantasia,
        bairro: bairro,
        media: media,
        logo: logo,
      );

      // Assert
      expect(motel.suites, suites);
      expect(motel.qtdAvaliacoes, qtdAvaliacoes);
      expect(motel.distancia, distancia);
      expect(motel.qtdFavoritos, qtdFavoritos);
      expect(motel.fantasia, fantasia);
      expect(motel.bairro, bairro);
      expect(motel.media, media);
      expect(motel.logo, logo);
    });

    test('should initialize with default values', () {
      // Act
      final motel = Motel();

      // Assert
      expect(motel.suites, []);
      expect(motel.qtdAvaliacoes, isNull);
      expect(motel.distancia, isNull);
      expect(motel.qtdFavoritos, isNull);
      expect(motel.fantasia, isNull);
      expect(motel.bairro, isNull);
      expect(motel.media, isNull);
      expect(motel.logo, isNull);
    });
  });
}
