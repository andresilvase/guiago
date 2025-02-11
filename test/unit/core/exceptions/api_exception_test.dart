import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/core/exceptions/api_exception.dart';

void main() {
  group('APIException', () {
    test('should initialize with the correct values', () {
      // Arrange
      const message = 'An error occurred';
      const statusCode = 404;

      // Act
      final apiException = APIException(message: message, statusCode: statusCode);

      // Assert
      expect(apiException.message, message);
      expect(apiException.statusCode, statusCode);
    });

    test('toString should return the correct string representation', () {
      // Arrange
      const message = 'An error occurred';
      const statusCode = 404;
      final apiException = APIException(message: message, statusCode: statusCode);

      // Act
      final result = apiException.toString();

      // Assert
      expect(result, 'APIException: $message (Status Code: $statusCode)');
    });
  });
}
