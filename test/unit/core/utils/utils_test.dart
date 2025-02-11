import 'package:flutter_test/flutter_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:guiago/core/utils/utils.dart';

void main() {
  group('Utils', () {
    test('hasInternet returns false when connectivityResult is null', () {
      // Act
      final result = Utils.hasInternet(null);

      // Assert
      expect(result, false);
    });

    test('hasInternet returns true when connectivityResult contains wifi', () {
      // Arrange
      final connectivityResult = [ConnectivityResult.wifi];

      // Act
      final result = Utils.hasInternet(connectivityResult);

      // Assert
      expect(result, true);
    });

    test('hasInternet returns true when connectivityResult contains mobile', () {
      // Arrange
      final connectivityResult = [ConnectivityResult.mobile];

      // Act
      final result = Utils.hasInternet(connectivityResult);

      // Assert
      expect(result, true);
    });

    test('hasInternet returns false when connectivityResult does not contain wifi or mobile', () {
      // Arrange
      final connectivityResult = [ConnectivityResult.none];

      // Act
      final result = Utils.hasInternet(connectivityResult);

      // Assert
      expect(result, false);
    });

    test('hasInternet returns true when connectivityResult contains both wifi and mobile', () {
      // Arrange
      final connectivityResult = [ConnectivityResult.wifi, ConnectivityResult.mobile];

      // Act
      final result = Utils.hasInternet(connectivityResult);

      // Assert
      expect(result, true);
    });
  });
}
