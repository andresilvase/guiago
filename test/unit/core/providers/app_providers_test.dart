import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guiago/core/providers/app_providers.dart';
import 'package:guiago/data/interfaces/interfaces.dart';
import 'package:guiago/core/domain/app_state.dart';
import 'package:guiago/core/repositories/repository.dart';
import 'package:guiago/core/services/api_service.dart';
import 'package:guiago/presentation/home/view_model/home_view_model.dart';
import 'package:hive_test/hive_test.dart';
import '../../../mocks/mocks.mocks.dart';
import '../../fixtures/fixtures.dart';
import '../../utility/riverpod_utility.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('app_providers', () {
    late MockRepositoryParams mockRepositoryParams;
    late APIServiceParams mockAPIServiceParams;
    late MockLocalStorage mockLocalStorage;
    late MockAPIService mockAPIService;
    late MockRepository mockRepository;
    late ProviderContainer container;
    late MockAppState mockAppState;

    setUp(() async {
      await setUpTestHive();
      mockRepositoryParams = MockRepositoryParams();
      mockAPIServiceParams = MockAPIServiceParams();
      mockLocalStorage = MockLocalStorage();
      mockAPIService = MockAPIService();
      mockRepository = MockRepository();
      mockAppState = MockAppState();

      container = createContainer(overrides: [
        connectivityProvider.overrideWith((ref) => Stream.value([ConnectivityResult.mobile])),
        apiServiceParamsProvider.overrideWith((ref) => mockAPIServiceParams),
        repositoryParamsProvider.overrideWith((ref) => mockRepositoryParams),
        baseUrlProvider.overrideWith((ref, fallbackUrl) => mockedBaseUrl),
        httpClientProvider.overrideWith((ref, client) => MockClient()),
        homeViewModelProvider.overrideWith(
          (ref) => HomeViewModel(
            repository: ref.read(repositoryProvider),
            hasInternet: true,
          ),
        ),
        localStorageProvider.overrideWith((ref) => mockLocalStorage),
        apiServiceProvider.overrideWith((ref) => mockAPIService),
        repositoryProvider.overrideWith((ref) => mockRepository),
        appStateProvider.overrideWith((ref) => mockAppState),
      ]);
    });

    test('apiServiceProvider provides an instance of APIService', () {
      final apiService = container.read(apiServiceProvider);
      expect(apiService, isA<APIService>());
    });

    test('localStorageProvider provides an instance of LocalStorage', () {
      final localStorage = container.read(localStorageProvider);
      expect(localStorage, isA<LocalStorage>());
    });

    test('repositoryProvider provides an instance of Repository', () {
      final repository = container.read(repositoryProvider);
      expect(repository, isA<Repository>());
    });

    test('homeViewModelProvider provides an instance of HomeViewModel', () {
      final homeViewModel = container.read(homeViewModelProvider.notifier);
      expect(homeViewModel, isA<HomeViewModel>());
    });

    test('appStateProvider provides an instance of AppState', () {
      final appState = container.read(appStateProvider);
      expect(appState, isA<AppState>());
    });

    // test('connectivityProvider provides a stream of ConnectivityResult', () async {
    //   final connectivityStream = container.read(connectivityProvider.future);
    //   expect(await connectivityStream, [ConnectivityResult.wifi]);
    // });
  });
}
