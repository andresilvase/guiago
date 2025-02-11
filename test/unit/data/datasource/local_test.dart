import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/data/interfaces/interfaces.dart';
import 'package:mockito/mockito.dart';
import 'package:guiago/core/exceptions/data_source_exception.dart';
import 'package:guiago/core/utils/constants.dart';
import 'package:guiago/data/datasource/local.dart';
import 'package:guiago/data/dto/response.dart';

import '../../../mocks/mocks.mocks.dart';
import '../../../fixtures/fixtures.dart';

void main() {
  group('LocalDataSource', () {
    late MockLocalStorage mockLocalStorage;
    late LocalDataSource localDataSource;

    setUp(() {
      mockLocalStorage = MockLocalStorage();
      localDataSource = LocalDataSourceImpl(localStorage: mockLocalStorage);
    });

    test('getData returns Response when localStorage.get is successful', () async {
      // Arrange
      final responseJson = jsonDecodedAPIResponse;
      when(mockLocalStorage.get(Constants.storageKey)).thenAnswer((_) async => responseJson);

      // Act
      final result = await localDataSource.getData();

      // Assert
      expect(result, isA<Response>());
      verify(mockLocalStorage.get(Constants.storageKey)).called(1);
    });

    test('getData throws DataSourceException when localStorage.get fails', () async {
      // Arrange
      when(mockLocalStorage.get(Constants.storageKey)).thenThrow(Exception('Error'));

      // Act & Assert
      expect(() async => await localDataSource.getData(), throwsA(isA<DataSourceException>()));
      verify(mockLocalStorage.get(Constants.storageKey)).called(1);
    });

    test('saveData calls localStorage.put with correct arguments', () async {
      // Arrange
      final response = Response.fromJson(jsonDecodedAPIResponse);
      final responseJson = response.toJson();
      when(mockLocalStorage.put(Constants.storageKey, responseJson)).thenAnswer((_) async => 1);

      // Act
      await localDataSource.saveData(response);

      // Assert
      verify(mockLocalStorage.put(Constants.storageKey, responseJson)).called(1);
    });

    test('saveData throws DataSourceException when localStorage.put fails', () async {
      // Arrange
      final response = Response.fromJson(jsonDecodedAPIResponse);
      when(mockLocalStorage.put(Constants.storageKey, response.toJson())).thenThrow(Exception('Error'));

      // Act & Assert
      expect(() async => await localDataSource.saveData(response), throwsA(isA<DataSourceException>()));
      verify(mockLocalStorage.put(Constants.storageKey, response.toJson())).called(1);
    });
  });
}
