import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/presentation/home/view_model/home_view_model.dart';
import 'package:guiago/presentation/home/widgets/header.dart';
import 'package:guiago/presentation/home/widgets/departure_time_selector.dart';
import 'package:guiago/presentation/home/widgets/my_local.dart';
import 'package:guiago/presentation/theme/app_theme.dart';
import '../../../../mocks/mocks.mocks.dart';
import '../../../shared/providers_overrides.dart';

void main() {
  late ProviderContainer container;
  late MockRepository mockRepository;
  late HomeViewModel homeViewModel;

  setUp(() {
    mockRepository = MockRepository();
    homeViewModel = HomeViewModel(
      hasInternet: true,
      repository: mockRepository,
    );

    container = ProviderContainer(
      overrides: [
        wifiConnectivityProviderOverride(),
        homeViewModelProviderOverride(
          homeViewModel: homeViewModel,
          repository: mockRepository,
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  Future<void> pumpHeader(WidgetTester tester) async {
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: Scaffold(
            body: Header(),
          ),
        ),
      ),
    );
    await tester.pump();
  }

  group('Header Widget', () {
    testWidgets('renders all basic components', (tester) async {
      await pumpHeader(tester);

      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byType(DepartureTimeSelector), findsOneWidget);
      expect(find.byType(MyLocal), findsOneWidget);
    });

    testWidgets('handles drawer menu tap', (tester) async {
      await pumpHeader(tester);

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pump();

      // Add assertions for drawer behavior if needed
    });

    testWidgets('handles search tap', (tester) async {
      await pumpHeader(tester);

      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();

      // Add assertions for search behavior if needed
    });

    testWidgets('departure time selector updates correctly', (tester) async {
      await pumpHeader(tester);

      // Initial state
      expect(homeViewModel.state.departureOption, 0);

      // Tap departure time selector
      await tester.tap(find.byType(DepartureTimeSelector));
      await tester.pump();

      // Verify departure option was updated
      expect(homeViewModel.state.departureOption, 1);
    });

    testWidgets('icons have correct colors', (tester) async {
      await pumpHeader(tester);

      final menuIcon = tester.widget<Icon>(find.byIcon(Icons.menu));
      final searchIcon = tester.widget<Icon>(find.byIcon(Icons.search));

      expect(menuIcon.color, GOColors.white);
      expect(searchIcon.color, GOColors.white);
    });
  });
}
