import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/core/exceptions/data_source_exception.dart';

void main() {
  group('DataSourceException', () {
    test('should initialize with the correct values', () {
      // Arrange
      const dataSource = 'Database';
      const message = 'An error occurred';

      // Act
      final dataSourceException = DataSourceException(dataSource: dataSource, message: message);

      // Assert
      expect(dataSourceException.dataSource, dataSource);
      expect(dataSourceException.message, message);
    });

    test('toString should return the correct string representation', () {
      // Arrange
      const dataSource = 'Database';
      const message = 'An error occurred';
      final dataSourceException = DataSourceException(dataSource: dataSource, message: message);

      // Act
      final result = dataSourceException.toString();

      // Assert
      expect(result, 'DataSourceException: $message.');
    });
  });
}
