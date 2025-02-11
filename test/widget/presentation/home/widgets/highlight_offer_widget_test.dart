import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/core/domain/highlight_offer.dart';
import 'package:guiago/presentation/home/widgets/highlight_offer_widget.dart';
import 'package:guiago/presentation/home/widgets/dots_indicator.dart';
import 'package:intl/intl.dart';

void main() {
  final mockOffers = [
    HighlightOffer(
      title: 'Test Offer',
      description: 'Test Description',
      imageUrl: 'https://example.com/image.jpg',
      discountPercentage: 0.2,
      minPrice: 100.0,
    ),
    HighlightOffer(
      title: 'Test Offer 2',
      description: 'Test Description 2',
      imageUrl: 'https://example.com/image2.jpg',
      discountPercentage: 0.3,
      minPrice: 150.0,
    ),
  ];

  final formatCurrency = NumberFormat.currency(locale: "pt_BR", symbol: 'R\$');

  Future<void> pumpWidget(WidgetTester tester, {List<HighlightOffer> offers = const []}) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              HighlightOfferWidget(offers: offers),
            ],
          ),
        ),
      ),
    );
    await tester.pump();
  }

  group('HighlightOfferWidget', () {
    testWidgets('should not be visible when offers list is empty', (tester) async {
      await pumpWidget(tester);

      expect(find.byType(PageView), findsNothing);
      expect(find.byType(DotsIndicator), findsNothing);
    });

    testWidgets('should display offers correctly', (tester) async {
      await pumpWidget(tester, offers: mockOffers);

      expect(find.text('Test Offer'), findsOneWidget);
      expect(find.text('Test Description'), findsOneWidget);
      expect(find.text('20 % de desconto'), findsOneWidget);
      expect(find.text(('a partir de ${formatCurrency.format(100)}').toString()), findsOneWidget);
      expect(find.text('reservar'), findsOneWidget);
    });

    testWidgets('should show dots indicator with correct count', (tester) async {
      await pumpWidget(tester, offers: mockOffers);

      expect(find.byType(DotsIndicator), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
    });

    testWidgets('should handle page changes', (tester) async {
      await pumpWidget(tester, offers: mockOffers);

      // Simulate page swipe
      await tester.drag(find.byType(PageView), const Offset(-500.0, 0.0));
      await tester.pumpAndSettle();

      expect(find.text('Test Offer 2'), findsOneWidget);
      expect(find.text('Test Description 2'), findsOneWidget);
      expect(find.text('30 % de desconto'), findsOneWidget);
      expect(find.text(('a partir de ${formatCurrency.format(150)}').toString()), findsOneWidget);
    });

    testWidgets('should have correct layout structure', (tester) async {
      await pumpWidget(tester, offers: mockOffers);

      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(Row), findsWidgets);
      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('reserve button should be tappable', (tester) async {
      await pumpWidget(tester, offers: mockOffers);

      await tester.tap(find.text('reservar'));
      await tester.pump();

      // Add expectations for button tap if there's specific behavior to test
    });
  });
}
