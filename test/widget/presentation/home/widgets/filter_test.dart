import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/presentation/home/view_model/home_view_model.dart';
import 'package:guiago/presentation/home/widgets/filter.dart';
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
        homeViewModelProviderOverride(homeViewModel: homeViewModel, repository: mockRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  Future<void> pumpFilterWidget(WidgetTester tester) async {
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [Filter()],
            ),
          ),
        ),
      ),
    );
    await tester.pump();
  }

  group('Filter Widget', () {
    testWidgets('renders filter button correctly', (tester) async {
      await pumpFilterWidget(tester);

      expect(find.text('filtros'), findsOneWidget);
      expect(find.byIcon(Icons.tune), findsOneWidget);
    });

    testWidgets('shows filter options list', (tester) async {
      await pumpFilterWidget(tester);

      expect(find.text('com desconto'), findsOneWidget);
      expect(find.text('hidro'), findsOneWidget);
      expect(find.text('piscina'), findsOneWidget);
    });
  });
}
