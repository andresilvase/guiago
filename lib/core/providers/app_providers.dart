import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guiago/core/domain/app_state.dart';
import 'package:guiago/core/repositories/repository.dart';
import 'package:guiago/core/services/api_service.dart';
import 'package:guiago/core/services/local_storage.dart';
import 'package:guiago/core/utils/utils.dart';
import 'package:guiago/data/datasource/local.dart';
import 'package:guiago/data/datasource/remote.dart';
import 'package:guiago/data/interfaces/interfaces.dart';
import 'package:guiago/presentation/home/view_model/home_state.dart';
import 'package:guiago/presentation/home/view_model/home_view_model.dart';
import 'package:http/http.dart' as http;

final connectivityProvider = FutureProvider<List<ConnectivityResult>>((ref) => Connectivity().checkConnectivity());

final appStateProvider = Provider<AppState>((ref) {
  return AppState(
    hasInternetConnection: Utils.hasInternet(ref.read(connectivityProvider).value),
  );
});

final baseUrlProvider = Provider.family<String, String>((ref, fallbackUrl) {
  return dotenv.env['BASE_URL'] ?? fallbackUrl;
});

final httpClientProvider = Provider.family<http.Client, http.Client?>((ref, client) {
  return client ?? http.Client();
});

final apiServiceParamsProvider = Provider<APIServiceParams>((ref) {
  return APIServiceParams(
    client: ref.read(httpClientProvider(null)),
    baseUrl: ref.read(baseUrlProvider('https://www.jsonkeeper.com/b/1IXK')),
  );
});

final apiServiceProvider = Provider<APIService>((ref) {
  return APIService(params: ref.read(apiServiceParamsProvider));
});

final localStorageProvider = Provider<LocalStorage>((ref) {
  return HiveStorage.instance;
});

final repositoryParamsProvider = Provider<RepositoryParams>((ref) {
  return RepositoryParams(
    localDataSource: LocalDataSourceImpl(localStorage: ref.read(localStorageProvider)),
    remoteDataSource: RemoteDataSourceImpl(apiService: ref.read(apiServiceProvider)),
  );
});

final repositoryProvider = Provider<Repository>((ref) {
  return Repository(params: ref.read(repositoryParamsProvider));
});

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  return HomeViewModel(
    hasInternet: ref.read(appStateProvider).hasInternetConnection,
    repository: ref.read(repositoryProvider),
  );
});
