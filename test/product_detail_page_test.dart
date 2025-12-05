import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_detail_page.dart';
import 'package:union_shop/cart_model.dart';

void main() {
  group('Product Detail Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(
        home: ProductDetailPage(
          title: 'Test Product',
          price: '£25.00',
          imageUrl: 'assets/test.png',
          description: 'Test Description',
        ),
      );
    }

    setUp(() {
      // Clear cart before each test
      Cart.instance.clear();
    });

    testWidgets('should display product name', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that product name is displayed
      expect(find.text('Test Product'), findsOneWidget);
    });

    testWidgets('should display product price', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that price is displayed
      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('should display color dropdown', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that color dropdown is present
      expect(find.text('Select Color'), findsOneWidget);
    });

    testWidgets('should display size dropdown', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that size dropdown is present
      expect(find.text('Select Size'), findsOneWidget);
    });

    testWidgets('should display Add to Cart button', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that Add to Cart button exists
      expect(find.text('Add to Cart'), findsOneWidget);
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

    testWidgets('should add item to cart when button pressed', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Select color
      await tester.tap(find.text('Select Color'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Navy Blue').last);
      await tester.pumpAndSettle();

      // Select size
      await tester.tap(find.text('Select Size'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('M').last);
      await tester.pumpAndSettle();

      // Tap Add to Cart
      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      // Verify item was added to cart
      expect(Cart.instance.items.length, 1);
      expect(Cart.instance.items[0].title, 'Test Product');
    });
  });
}
