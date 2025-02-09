import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guiago/core/domain/app_state.dart';
import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/core/repositories/repository.dart';
import 'package:guiago/core/services/api_service.dart';
import 'package:guiago/core/utils/utils.dart';
import 'package:guiago/data/datasource/local_response.dart';
import 'package:guiago/data/datasource/remote_response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:guiago/presentation/home/viewmodel/home_view_model.dart';

final connectivityProvider = StreamProvider<List<ConnectivityResult>>((ref) {
  return Connectivity().onConnectivityChanged.map((event) => event);
});

final appStateProvider = Provider<AppState>((ref) {
  return AppState(hasInternetConnection: Utils.hasInternet(ref.read(connectivityProvider).value));
});

final apiServiceProvider = Provider<APIService>((ref) {
  return APIService(
    baseUrl: dotenv.env['BASE_URL']!,
    client: http.Client(),
  );
});

final repositoryProvider = Provider<Repository>((ref) {
  return Repository(
    remoteDataSource: RemoteResponseDataSource(apiService: ref.read(apiServiceProvider)),
    localDataSource: LocalResponseDataSource(),
  );
});

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, List<Motel>>((ref) {
  return HomeViewModel(
    repository: ref.read(repositoryProvider),
    ref: ref,
  );
});
