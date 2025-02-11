import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:guiago/main.dart';
import 'package:guiago/presentation/home/views/home.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../test/widget/shared/providers_overrides.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('GuiaGo Integration Tests', () {
    testWidgets('App initializes and loads correctly', (tester) async {
      await initializeApp();

      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.byType(Home), findsOneWidget);
    });

    testWidgets('Connectivity error handling', (tester) async {
      await initializeApp();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [errorConnectivityProviderOverride()],
          child: const MyApp(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('home_error_message')), findsOneWidget);
      expect(find.text('Erro ao carregar os dados'), findsOneWidget);
    });

    testWidgets('Theme configuration is correct', (tester) async {
      await initializeApp();

      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(),
        ),
      );

      final GetMaterialApp app = tester.widget(find.byType(GetMaterialApp));
      expect(app.debugShowCheckedModeBanner, false);
      expect(app.theme?.useMaterial3, true);
    });

    testWidgets('Safe area is properly applied', (tester) async {
      await initializeApp();

      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(),
        ),
      );

      expect(find.byType(SafeArea), findsOneWidget);
      final SafeArea safeArea = tester.widget(find.byType(SafeArea));
      expect(safeArea.bottom, false);
    });
  });
}
