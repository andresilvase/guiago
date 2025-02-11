import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:guiago/core/services/api_service.dart';
import 'package:guiago/core/exceptions/api_exception.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../mocks/mocks.mocks.dart';
import '../../fixtures/fixtures.dart';

void main() {
  group('APIService', () {
    late MockClient mockClient;
    late APIService apiService;

    setUp(() {
      mockClient = MockClient();
      apiService = APIService(
        params: APIServiceParams(
          baseUrl: mockedBaseUrl,
          client: mockClient,
        ),
      );
    });

    test('get calls client.get with the correct URL', () async {
      // Arrange
      final responseBody = jsonEncode({'key': 'value'});
      when(mockClient.get(Uri.parse(mockedBaseUrl))).thenAnswer((_) async => http.Response(responseBody, 200));

      // Act
      await apiService.get();

      // Assert
      verify(mockClient.get(Uri.parse(mockedBaseUrl))).called(1);
    });

    test('get returns data when the http call completes successfully', () async {
      // Arrange
      final responseBody = jsonEncode({'key': 'value'});
      when(mockClient.get(Uri.parse(mockedBaseUrl))).thenAnswer((_) async => http.Response(responseBody, 200));

      // Act
      final result = await apiService.get();

      // Assert
      expect(result, {'key': 'value'});
    });

    test('get throws APIException when the http call completes with an error', () async {
      // Arrange
      when(mockClient.get(Uri.parse(mockedBaseUrl))).thenAnswer((_) async => http.Response('Error', 404));

      // Act & Assert
      expect(() async => await apiService.get(), throwsA(isA<APIException>()));
    });

    test('handleResponse returns data when status code is 200', () {
      // Arrange
      final responseBody = jsonEncode({'key': 'value'});
      final response = http.Response(responseBody, 200);

      // Act
      final result = apiService.handleResponse(response);

      // Assert
      expect(result, {'key': 'value'});
    });

    test('handleResponse throws APIException when status code is not 200', () {
      // Arrange
      final response = http.Response('Error', 404);

      // Act & Assert
      expect(() => apiService.handleResponse(response), throwsA(isA<APIException>()));
    });
  });
}
