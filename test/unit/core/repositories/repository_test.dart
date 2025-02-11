import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/core/exceptions/api_exception.dart';
import 'package:guiago/core/exceptions/data_source_exception.dart';
import 'package:guiago/core/repositories/repository.dart';
import 'package:guiago/data/dto/response.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mocks.mocks.dart';
import '../../fixtures/fixtures.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late Repository repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();

    repository = Repository(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  group('Repository should return a list of motels', () {
    test('when there is internet connection', () async {
      // Arrange
      when(mockRemoteDataSource.getData()).thenAnswer((_) async => Response.fromJson(jsonDecodedAPIResponse));

      // Act
      final hasInternet = true;
      final moteltelList = await repository.getMotelList(hasInternet);

      // Assert
      expect(moteltelList, isA<List<Motel>>());
      expect(moteltelList.isNotEmpty, true);

      verify(mockRemoteDataSource.getData()).called(1);
    });

    test('when there is no internet connection', () async {
      // Arrange
      when(mockLocalDataSource.getData()).thenAnswer((_) async => Response.fromJson(jsonDecodedAPIResponse));

      // Act
      final hasInternet = false;
      final moteltelList = await repository.getMotelList(hasInternet);

      // Assert
      expect(moteltelList, isA<List<Motel>>());
      expect(moteltelList.isNotEmpty, true);
      verify(mockLocalDataSource.getData()).called(1);
    });
  });

  group('Repository should throw', () {
    test('APIException when remote data source fails', () async {
      // Arrange
      when(mockRemoteDataSource.getData()).thenThrow(APIException(message: 'Error', statusCode: 400));
      final hasInternet = true;

      // Act
      expect(() async => await repository.getMotelList(hasInternet), throwsA(isA<APIException>()));
    });

    test('DataSourceException when local data source fails', () async {
      // Arrange
      when(mockLocalDataSource.getData())
          .thenThrow(DataSourceException(message: 'Error', dataSource: 'LocalDataSource'));
      final hasInternet = false;

      // Act && Assert
      expect(() async => await repository.getMotelList(hasInternet), throwsA(isA<DataSourceException>()));
    });
  });

  test('Repository should save remote data to local data source', () async {
    final response = Response.fromJson(jsonDecodedAPIResponse);

    // Arrange
    when(mockRemoteDataSource.getData()).thenAnswer((_) async => response);

    // Act
    final hasInternet = true;
    await repository.getMotelList(hasInternet);

    // Assert
    verify(mockRemoteDataSource.getData()).called(1);
    verify(mockLocalDataSource.saveData(response)).called(1);
  });
}
