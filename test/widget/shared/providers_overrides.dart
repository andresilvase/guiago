import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:guiago/core/providers/app_providers.dart';
import 'package:guiago/core/repositories/repository.dart';
import 'package:guiago/core/services/api_service.dart';
import 'package:guiago/data/datasource/local.dart';
import 'package:guiago/data/datasource/remote.dart';
import 'package:guiago/presentation/home/view_model/home_view_model.dart';
import 'package:riverpod/riverpod.dart';

import '../../fixtures/fixtures.dart';
import '../../mocks/mocks.mocks.dart';

Override wifiConnectivityProviderOverride() {
  return connectivityProvider.overrideWith(
    (ref) => Future.value([ConnectivityResult.wifi]),
  );
}

Override noConnectivityProviderOverride() {
  return connectivityProvider.overrideWith(
    (ref) => Future.value([ConnectivityResult.none]),
  );
}

Override errorConnectivityProviderOverride() {
  return connectivityProvider.overrideWith(
    (ref) => Future.error('Erro ao carregar os dados'),
  );
}

Override repositoryProviderOverride({Repository? repository}) {
  return repositoryProvider.overrideWith((ref) {
    return repository ??
        Repository(
          params: RepositoryParams(
            localDataSource: LocalDataSourceImpl(localStorage: MockLocalStorage()),
            remoteDataSource: RemoteDataSourceImpl(
              apiService: APIService(
                params: APIServiceParams(
                  baseUrl: mockedBaseUrl,
                  client: MockClient(),
                ),
              ),
            ),
          ),
        );
  });
}

Override homeViewModelProviderOverride({HomeViewModel? homeViewModel, Repository? repository, bool? hasInternet}) {
  return homeViewModelProvider.overrideWith((ref) {
    return homeViewModel ??
        HomeViewModel(
          hasInternet: hasInternet ?? ref.read(appStateProvider).hasInternetConnection,
          repository: repository ?? ref.read(repositoryProvider),
        );
  });
}
