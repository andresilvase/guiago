import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/presentation/home/view_model/home_view_model.dart';
import 'package:guiago/presentation/home/views/motel_list.dart';
import 'package:guiago/presentation/home/widgets/motel_item.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/mocks.mocks.dart';
import '../../../shared/providers_overrides.dart';

void main() {
  late ProviderContainer container;
  late MockRepository mockRepository;
  late HomeViewModel homeViewModel;

  setUp(() {
    mockRepository = MockRepository();
    homeViewModel = HomeViewModel(hasInternet: true, repository: mockRepository);

    container = ProviderContainer(
      overrides: [
        wifiConnectivityProviderOverride(),
        homeViewModelProviderOverride(homeViewModel: homeViewModel, repository: mockRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('MotelList', () {
    testWidgets('shows loading indicator when fetching data', (WidgetTester tester) async {
      // Arrange
      when(mockRepository.getMotelList(homeViewModel.hasInternet))
          .thenAnswer((_) => Future.delayed(const Duration(seconds: 1)));

      // Act
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: MotelList(),
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows motel list when data is loaded successfully', (WidgetTester tester) async {
      // Arrange
      final motelList = [
        Motel(
          suites: [],
          qtdAvaliacoes: 10,
          qtdFavoritos: 5,
          distancia: 1.5,
          fantasia: 'Test Motel',
          bairro: 'Downtown',
          media: 4.5,
          logo: 'test_logo.png',
        ),
      ];

      when(mockRepository.getMotelList(homeViewModel.hasInternet)).thenAnswer((_) async => motelList);

      // Act
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: GetMaterialApp(
            // Changed from MaterialApp to GetMaterialApp
            home: Scaffold(
              body: SizedBox(
                width: 800,
                height: 600,
                child: MotelList(),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      await tester.pumpAndSettle();

      expect(homeViewModel.state.motelList, motelList);

      // Assert
      expect(find.byType(MotelItem), findsOneWidget);
    });

    testWidgets('shows error message when data fetch fails', (WidgetTester tester) async {
      // Arrange
      when(mockRepository.getMotelList(homeViewModel.hasInternet))
          .thenAnswer((_) async => Future.error('Error loading data'));

      // Act
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: MotelList(),
            ),
          ),
        ),
      );

      await tester.pump();
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Erro ao carregar os dados'), findsOneWidget);
    });
  });
}
