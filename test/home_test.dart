import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with sale banner', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that sale banner is present
      expect(
        find.text('BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
        findsOneWidget,
      );
    });

    testWidgets('should display navigation menu', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check navigation elements
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('The Print Shack'), findsOneWidget);
      expect(find.text('Sale'), findsOneWidget);
    });

    testWidgets('should display collection cards', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that collection cards are displayed
      expect(find.text('Signature & Essential Range'), findsWidgets);
      expect(find.text('Portsmouth City Collection'), findsWidgets);
    });

    testWidgets('should display cart and login buttons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that cart and login buttons are present
      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('should navigate to cart page', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Tap on Cart button
      await tester.tap(find.text('Cart'));
      await tester.pumpAndSettle();

      // Verify navigation to cart page
      expect(find.text('Your Cart'), findsOneWidget);
    });

    testWidgets('should have Shop dropdown menu', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Find Shop button with dropdown
      expect(find.text('Shop'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_drop_down), findsWidgets);
    });

    testWidgets('should have footer section', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check for footer elements
      expect(find.text('About Us'), findsOneWidget);
      expect(find.text('Contact'), findsOneWidget);
    });
  });
}
