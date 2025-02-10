import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/core/exceptions/api_exception.dart';
import 'package:guiago/data/datasource/local.dart';
import 'package:guiago/data/datasource/remote.dart';
import 'package:guiago/data/mappers/motel_mapper.dart';

class Repository {
  final RemoteDataSource remoteDataSource;
  final LocalResponseDataSource localDataSource;

  Repository({required this.remoteDataSource, required this.localDataSource});

  Future<List<Motel>> getMotelList(bool hasInternet) async {
    List<Motel> motelList = [];

    try {
      if (hasInternet) {
        final response = await remoteDataSource.getData();

        if (response.sucesso == true) {
          for (var m in response.data!.moteis) {
            motelList.add(MotelMapper.fromDTO(m));
          }
        }
      } else {
        // TODO: get data from local
      }

      return motelList;
    } on APIException catch (e) {
      throw APIException(statusCode: e.statusCode, message: e.message);
    }
  }
}
