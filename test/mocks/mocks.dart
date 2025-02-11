import 'package:guiago/core/domain/app_state.dart';
import 'package:guiago/core/repositories/repository.dart';
import 'package:guiago/core/services/api_service.dart';
import 'package:guiago/data/interfaces/interfaces.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  RemoteDataSource,
  LocalDataSource,
  APIServiceParams,
  RepositoryParams,
  LocalStorage,
  http.Client,
  APIService,
  Repository,
  AppState,
])
void main() {}
