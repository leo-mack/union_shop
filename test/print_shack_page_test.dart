import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/print_shack_page.dart';

void main() {
  group('Print Shack Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: PrintShackPage());
    }

    testWidgets('should display page title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that page title is present
      expect(find.text('The Print Shack'), findsOneWidget);
    });

    testWidgets('should display sale banner', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check sale banner
      expect(
        find.text('BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
        findsOneWidget,
      );
    });

    testWidgets('should have navigation menu', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check navigation elements
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('The Print Shack'), findsOneWidget);
    });

    testWidgets('should display service information', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that service information is displayed
      expect(find.text('Personalisation Services'), findsOneWidget);
      expect(find.text('Custom Text Printing'), findsOneWidget);
    });

    testWidgets('should display hero image', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that hero image is present
      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('should have footer section', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check for footer elements
      expect(find.text('About Us'), findsOneWidget);
      expect(find.text('Contact'), findsOneWidget);
    });

    testWidgets('should display pricing information', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check for pricing details
      expect(find.textContaining('£'), findsWidgets);
    });
  });
}
