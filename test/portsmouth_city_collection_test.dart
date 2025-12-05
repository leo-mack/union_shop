import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/portsmouth_city_collection.dart';

void main() {
  group('Portsmouth City Collection Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: PortsmouthCityCollection());
    }

    testWidgets('should display page title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that page title is present
      expect(find.text('Portsmouth City Collection'), findsWidgets);
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
    });

    testWidgets('should display product cards', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that Portsmouth products are displayed
      expect(find.text('Portsmouth Hoodie'), findsOneWidget);
      expect(find.text('Portsmouth T-Shirt'), findsOneWidget);
    });

    testWidgets('should display product prices', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that prices are displayed
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
