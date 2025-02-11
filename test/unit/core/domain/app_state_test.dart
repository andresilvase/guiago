import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/core/domain/app_state.dart';

void main() {
  group('AppState', () {
    test('should initialize with the correct hasInternetConnection value', () {
      // Arrange
      const hasInternetConnection = true;

      // Act
      final appState = AppState(hasInternetConnection: hasInternetConnection);

      // Assert
      expect(appState.hasInternetConnection, hasInternetConnection);
    });

    test('should initialize with the correct hasInternetConnection value as false', () {
      // Arrange
      const hasInternetConnection = false;

      // Act
      final appState = AppState(hasInternetConnection: hasInternetConnection);

      // Assert
      expect(appState.hasInternetConnection, hasInternetConnection);
    });
  });
}
