import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/personalisation_page.dart';
import 'package:union_shop/cart_model.dart';

void main() {
  group('Personalisation Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: PersonalisationPage());
    }

    setUp(() {
      // Clear cart before each test
      Cart.instance.clear();
    });

    testWidgets('should display page title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that page title is present
      expect(find.text('Personalise Your Item'), findsOneWidget);
    });

    testWidgets('should display product image', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that product image is displayed
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should display line count dropdown', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that dropdown for number of lines is present
      expect(find.text('Number of Lines'), findsOneWidget);
    });

    testWidgets('should have navigation menu', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check navigation elements
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
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

    testWidgets('should display text input fields when lines selected', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Select 2 lines
      await tester.tap(find.text('Number of Lines'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('2 Lines').last);
      await tester.pumpAndSettle();

      // Check that text input fields appear
      expect(find.text('Line 1'), findsOneWidget);
      expect(find.text('Line 2'), findsOneWidget);
    });

    testWidgets('should display correct price for 1 line', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Select 1 line
      await tester.tap(find.text('Number of Lines'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('1 Line').last);
      await tester.pumpAndSettle();

      // Check price
      expect(find.text('£3.00'), findsOneWidget);
    });

    testWidgets('should display correct price for 2+ lines', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Select 2 lines
      await tester.tap(find.text('Number of Lines'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('2 Lines').last);
      await tester.pumpAndSettle();

      // Check price
      expect(find.text('£5.00'), findsOneWidget);
    });

    testWidgets('should have Add to Cart button', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that Add to Cart button exists
      expect(find.text('Add to Cart'), findsOneWidget);
    });
  });
}
