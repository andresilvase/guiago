import 'package:guiago/core/repositories/repository.dart';
import 'package:guiago/core/services/api_service.dart';
import 'package:guiago/data/datasource/local.dart';
import 'package:guiago/data/datasource/remote.dart';
import 'package:guiago/data/interfaces/local_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  RemoteDataSource,
  LocalDataSource,
  LocalStorage,
  APIService,
  Repository,
  http.Client,
])
void main() {}
