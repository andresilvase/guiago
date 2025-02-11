import 'package:guiago/core/domain/app_state.dart';
import 'package:guiago/core/repositories/repository.dart';
import 'package:guiago/core/services/api_service.dart';
import 'package:guiago/data/interfaces/interfaces.dart';
import 'package:guiago/presentation/home/view_model/home_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  RemoteDataSource,
  LocalDataSource,
  RepositoryParams,
  APIServiceParams,
  HomeViewModel,
  LocalStorage,
  http.Client,
  APIService,
  Repository,
  AppState,
])
void main() {}
