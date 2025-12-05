import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_page.dart';

void main() {
  group('About Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: AboutPage());
    }

    testWidgets('should display page title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that page title is present
      expect(find.text('About Us'), findsWidgets);
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

    testWidgets('should display union information', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that union information is displayed
      expect(find.textContaining('Students\' Union'), findsWidgets);
    });

    testWidgets('should have footer section', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check for footer elements
      expect(find.text('About Us'), findsWidgets);
      expect(find.text('Contact'), findsOneWidget);
    });
  });
}
