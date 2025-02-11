import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/presentation/home/widgets/departure_time_selector.dart';
import 'package:guiago/presentation/theme/app_theme.dart';

void main() {
  group('DepartureTimeSelector', () {
    testWidgets('renders all departure options correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DepartureTimeSelector(
              departureOption: 0,
              onDepartureTimeChange: () {},
            ),
          ),
        ),
      );

      // Verify texts are present
      expect(find.text('ir agora'), findsOneWidget);
      expect(find.text('ir outro dia'), findsOneWidget);

      // Verify icons are present
      expect(find.byIcon(Icons.flash_on_rounded), findsOneWidget);
      expect(find.byIcon(Icons.calendar_month_outlined), findsOneWidget);
    });

    testWidgets('highlights selected option correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DepartureTimeSelector(
              departureOption: 0,
              onDepartureTimeChange: () {},
            ),
          ),
        ),
      );

      // Find all containers
      final containers = tester.widgetList<Container>(find.byType(Container));

      // Find the selected container (should have white background)
      final selectedContainer = containers.firstWhere(
        (container) => (container.decoration as BoxDecoration?)?.color == GOColors.white,
      );

      expect(selectedContainer, isNotNull);
    });

    testWidgets('calls onDepartureTimeChange when tapped', (WidgetTester tester) async {
      bool wasCallbackCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DepartureTimeSelector(
              departureOption: 0,
              onDepartureTimeChange: () {
                wasCallbackCalled = true;
              },
            ),
          ),
        ),
      );

      // Tap the selector
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      expect(wasCallbackCalled, isTrue);
    });

    testWidgets('applies correct styles to selected and unselected items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DepartureTimeSelector(
              departureOption: 0,
              onDepartureTimeChange: () {},
            ),
          ),
        ),
      );

      // Find text widgets
      final selectedText = tester.widget<Text>(find.text('ir agora'));
      final unselectedText = tester.widget<Text>(find.text('ir outro dia'));

      // Verify text styles
      expect(selectedText.style?.color, GOColors.black);
      expect(unselectedText.style?.color, GOColors.white);

      // Find icons
      final selectedIcon = tester.widget<Icon>(find.byIcon(Icons.flash_on_rounded));
      final unselectedIcon = tester.widget<Icon>(
        find.byIcon(Icons.calendar_month_outlined),
      );

      // Verify icon colors
      expect(selectedIcon.color, GOColors.primaryColor);
      expect(unselectedIcon.color, GOColors.white);
    });
  });
}
