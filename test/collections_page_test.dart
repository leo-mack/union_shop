import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/collections_page.dart';

void main() {
  group('Collections Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: CollectionsPage());
    }

    testWidgets('should display page title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that page title is present
      expect(find.text('Our Collections'), findsOneWidget);
    });

    testWidgets('should display Signature & Essential Range collection', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that Signature & Essential Range is displayed
      expect(find.text('Signature & Essential Range'), findsWidgets);
    });

    testWidgets('should display Portsmouth City Collection', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that Portsmouth City Collection is displayed
      expect(find.text('Portsmouth City Collection'), findsWidgets);
    });

    testWidgets('should have navigation menu', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check navigation elements
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
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

    testWidgets('should have footer section', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check for footer elements
      expect(find.text('About Us'), findsOneWidget);
      expect(find.text('Contact'), findsOneWidget);
    });

    testWidgets('should display collection descriptions', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that collection descriptions are present
      expect(find.textContaining('premium'), findsOneWidget);
      expect(find.textContaining('Portsmouth'), findsOneWidget);
    });
  });
}
