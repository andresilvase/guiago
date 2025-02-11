import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:guiago/core/exceptions/api_exception.dart';
import 'package:guiago/core/exceptions/data_source_exception.dart';
import 'package:guiago/data/datasource/remote.dart';
import 'package:guiago/data/dto/response.dart';

import '../../../mocks/mocks.mocks.dart';
import '../../fixtures/fixtures.dart';

void main() {
  group('RemoteDataSource', () {
    late MockAPIService mockAPIService;
    late RemoteDataSource remoteDataSource;

    setUp(() {
      mockAPIService = MockAPIService();
      remoteDataSource = RemoteDataSource(apiService: mockAPIService);
    });

    test('getData returns Response when apiService.get is successful', () async {
      // Arrange
      final responseJson = jsonDecodedAPIResponse;
      when(mockAPIService.get()).thenAnswer((_) async => responseJson);

      // Act
      final result = await remoteDataSource.getData();

      // Assert
      expect(result, isA<Response>());
      verify(mockAPIService.get()).called(1);
    });

    test('getData throws APIException when apiService.get throws APIException', () async {
      // Arrange
      when(mockAPIService.get()).thenThrow(APIException(message: 'Error', statusCode: 404));

      // Act & Assert
      expect(() async => await remoteDataSource.getData(), throwsA(isA<APIException>()));
      verify(mockAPIService.get()).called(1);
    });

    test('getData throws DataSourceException when apiService.get throws Exception', () async {
      // Arrange
      when(mockAPIService.get()).thenThrow(Exception('Error'));

      // Act & Assert
      expect(() async => await remoteDataSource.getData(), throwsA(isA<DataSourceException>()));
      verify(mockAPIService.get()).called(1);
    });
  });
}
