import 'package:guiago/data/dto/response.dart';

abstract class LocalStorage {
  Future<int> put(String key, Map<String, dynamic> value);
  Future<Map<String, dynamic>> get(String key);
  Future<int> delete(String key);
}

abstract class RemoteDataSource {
  Future<dynamic> getData();
}

abstract class LocalDataSource {
  Future<dynamic> getData();
  Future<void> saveData(Response response);
}
