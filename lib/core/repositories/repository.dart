import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/core/exceptions/api_exception.dart';
import 'package:guiago/core/exceptions/data_source_exception.dart';
import 'package:guiago/data/dto/response.dart';
import 'package:guiago/data/interfaces/interfaces.dart';

import 'package:guiago/data/mappers/motel_mapper.dart';

class RepositoryParams {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  RepositoryParams({required this.remoteDataSource, required this.localDataSource});
}

class Repository {
  Repository({required this.params});

  final RepositoryParams params;

  Future<List<Motel>> getMotelList(bool hasInternet) async {
    List<Motel> motelList = [];

    try {
      late Response response;

      if (hasInternet) {
        response = await params.remoteDataSource.getData();
        await params.localDataSource.saveData(response);
      } else {
        response = await params.localDataSource.getData();
      }

      if (response.sucesso == true) {
        for (var m in response.data!.moteis) {
          motelList.add(MotelMapper.fromDTO(m));
        }
      }

      return motelList;
    } on APIException catch (e) {
      throw APIException(message: e.message, statusCode: e.statusCode);
    } on DataSourceException catch (e) {
      throw DataSourceException(message: e.message, dataSource: e.dataSource);
    }
  }
}
