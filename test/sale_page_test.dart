import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/sale_page.dart';

void main() {
  group('Sale Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: SalePage());
    }

    testWidgets('should display page title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that page title is present
      expect(find.text('Sale Items'), findsOneWidget);
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

    testWidgets('should display sale products', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that sale products are displayed
      expect(find.text('Essential Hoodie'), findsOneWidget);
      expect(find.text('Essential T-Shirt'), findsOneWidget);
    });

    testWidgets('should display sale prices in red', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that sale prices exist
      expect(find.textContaining('£'), findsWidgets);
    });

    testWidgets('should have footer section', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check for footer elements
      expect(find.text('About Us'), findsOneWidget);
      expect(find.text('Contact'), findsOneWidget);
    });

    testWidgets('should display product grid', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that products are displayed in a grid
      expect(find.byType(GridView), findsOneWidget);
    });
  });
}
