import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:guiago/main.dart';
import 'package:guiago/presentation/home/views/home.dart';
import '../../../../utility/riverpod_utility.dart';
import '../../../shared/providers_overrides.dart';

void main() {
  late ProviderContainer container;

  group('GuiaGo app', () {
    testWidgets('should render MyApp with ProviderScope', (WidgetTester tester) async {
      container = createContainer(
        overrides: [
          wifiConnectivityProviderOverride(),
          repositoryProviderOverride(),
          homeViewModelProviderOverride(),
        ],
      );
      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(),
        ),
      );

      expect(find.byType(GetMaterialApp), findsOneWidget);
      expect(find.byType(GuiaGo), findsOneWidget);
    });

    testWidgets('should render loading state when connectivity is loading', (WidgetTester tester) async {
      container = createContainer(
        overrides: [
          wifiConnectivityProviderOverride(),
          repositoryProviderOverride(),
          homeViewModelProviderOverride(),
        ],
      );
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: GuiaGo(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should render Home when connectivity is available', (WidgetTester tester) async {
      container = createContainer(
        overrides: [
          wifiConnectivityProviderOverride(),
          repositoryProviderOverride(),
          homeViewModelProviderOverride(),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: GuiaGo(),
          ),
        ),
      );

      await tester.pump(const Duration(seconds: 1));

      expect(find.byType(Home), findsOneWidget);
    });

    testWidgets('should render a text message error when connectivity is not available', (WidgetTester tester) async {
      container = createContainer(
        overrides: [
          noConnectivityProviderOverride(),
          repositoryProviderOverride(),
          homeViewModelProviderOverride(),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: GuiaGo(),
          ),
        ),
      );

      await tester.pump(const Duration(seconds: 1));

      expect(find.byKey(Key('home_error_message')), findsOneWidget);
    });
  });
}
