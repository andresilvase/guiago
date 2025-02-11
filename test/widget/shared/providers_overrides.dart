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

Override repositoryProviderOverride() {
  return repositoryProvider.overrideWith(
    (ref) => Repository(
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
    ),
  );
}

Override homeViewModelProviderOverride() {
  return homeViewModelProvider.overrideWith(
    (ref) => HomeViewModel(
      hasInternet: true,
      repository: ref.read(repositoryProvider),
    ),
  );
}
