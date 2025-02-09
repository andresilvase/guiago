import 'package:guiago/data/datasource/local_response.dart';
import 'package:guiago/data/datasource/remote_response.dart';

class Repository {
  final RemoteResponseDataSource remoteDataSource;
  final LocalResponseDataSource localDataSource;

  Repository({required this.remoteDataSource, required this.localDataSource});

  Future<List<dynamic>> getMotelList() async {
    return [];
  }
}
