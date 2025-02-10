import 'package:guiago/core/exceptions/data_source_exception.dart';
import 'package:guiago/core/utils/constants.dart';
import 'package:guiago/data/interfaces/data_source.dart';
import 'package:guiago/data/dto/response.dart';
import 'package:guiago/data/interfaces/local_storage.dart';

class LocalDataSource implements DataSource {
  final LocalStorage localStorage;

  LocalDataSource({required this.localStorage});

  @override
  Future<Response> getData() async {
    try {
      final response = await localStorage.get(Constants.storageKey);

      final responseData = Response.fromJson(response);

      return responseData;
    } on Exception catch (e) {
      throw DataSourceException(message: e.toString(), dataSource: 'LocalDataSource');
    }
  }

  Future<void> saveData(Response response) async {
    try {
      await localStorage.put(Constants.storageKey, response.toJson());
    } on Exception catch (e) {
      throw DataSourceException(message: e.toString(), dataSource: 'LocalDataSource');
    }
  }
}
