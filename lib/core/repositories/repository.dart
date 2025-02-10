import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/core/exceptions/api_exception.dart';
import 'package:guiago/core/exceptions/data_source_exception.dart';
import 'package:guiago/data/datasource/local.dart';
import 'package:guiago/data/datasource/remote.dart';
import 'package:guiago/data/dto/response.dart';
import 'package:guiago/data/mappers/motel_mapper.dart';

class Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  Repository({required this.remoteDataSource, required this.localDataSource});

  Future<List<Motel>> getMotelList(bool hasInternet) async {
    List<Motel> motelList = [];

    try {
      late Response response;

      if (hasInternet) {
        response = await remoteDataSource.getData();
      } else {
        response = await localDataSource.getData();
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
