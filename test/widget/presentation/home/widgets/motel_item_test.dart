import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:guiago/core/domain/motel.dart';
import 'package:guiago/core/domain/suites.dart';
import 'package:guiago/presentation/home/widgets/motel_item.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

void main() {
  final mockSuite = Suites(
    nome: 'Test Suite',
    fotos: ['https://example.com/photo.jpg'],
    categoriaItens: [
      SuiteCategoriaItem(
        icone: 'https://example.com/icon.png',
        nome: 'Test Item 1',
      ),
      SuiteCategoriaItem(
        icone: 'https://example.com/icon.png',
        nome: 'Test Item 2',
      ),
      SuiteCategoriaItem(
        icone: 'https://example.com/icon.png',
        nome: 'Test Item 3',
      ),
      SuiteCategoriaItem(
        icone: 'https://example.com/icon.png',
        nome: 'Test Item 4',
      ),
    ],
    periodos: [
      SuitePeriod(
        tempoFormatado: '2 horas',
        valorTotal: 150.0,
      ),
    ],
  );

  final mockMotel = Motel(
    fantasia: 'Test Motel',
    bairro: 'Test District',
    media: 4.5,
    qtdAvaliacoes: 100,
    logo: 'https://example.com/logo.jpg',
    suites: [mockSuite],
  );

  Future<void> pumpWidget(WidgetTester tester) async {
    Get.testMode = true;

    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: MotelItem(motel: mockMotel),
        ),
      ),
    );
    await tester.pump();
  }

  group('MotelItem', () {
    testWidgets('renders header section correctly', (tester) async {
      await pumpWidget(tester);

      expect(find.text('Test Motel'), findsOneWidget);
      expect(find.text('Test District'), findsOneWidget);
      expect(find.text('4.5'), findsOneWidget);
      expect(find.text('100 avaliações'), findsOneWidget);
    });

    testWidgets('shows favorite button with correct color', (tester) async {
      await pumpWidget(tester);

      final favoriteIcon = tester.widget<Icon>(
        find.descendant(
          of: find.byType(IconButton),
          matching: find.byIcon(Icons.favorite),
        ),
      );

      expect(
        favoriteIcon.color,
        GOColors.textColor.withValues(alpha: 0.3),
      );
    });

    testWidgets('has correct layout structure', (tester) async {
      await pumpWidget(tester);

      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Row), findsWidgets);
      expect(find.byKey(const Key('horizontal_scroll')), findsOneWidget);
      expect(find.byKey(const Key('vertical_scroll')), findsOneWidget);
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('handles null values gracefully', (tester) async {
      final emptyMotel = Motel(
        suites: [],
      );

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: MotelItem(motel: emptyMotel),
          ),
        ),
      );
      await tester.pump();

      expect(find.text(''), findsWidgets);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('scrolls suite list horizontally', (tester) async {
      await pumpWidget(tester);

      final listView = find.byKey(const Key('horizontal_scroll'));
      await tester.drag(listView, const Offset(-500.0, 0.0));
      await tester.pump();
    });
  });
}
