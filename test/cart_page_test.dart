import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/cart_model.dart';

void main() {
  group('Cart Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: CartPage());
    }

    setUp(() {
      // Clear cart before each test
      Cart.instance.clear();
    });

    testWidgets('should display empty cart message when cart is empty', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check for empty cart message
      expect(find.text('Your cart is empty'), findsOneWidget);
      expect(find.text('Add some items to get started!'), findsOneWidget);
    });

    testWidgets('should display cart title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that cart title is present
      expect(find.text('Your Cart'), findsOneWidget);
    });

    testWidgets('should display navigation menu', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check navigation elements
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('The Print Shack'), findsOneWidget);
    });

    testWidgets('should display cart items when items exist', (tester) async {
      // Add a test item to cart
      Cart.instance.addItem(CartItem(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'assets/test.png',
        color: 'Red',
        size: 'M',
      ));

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that item is displayed
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);
      expect(find.text('Color: Red'), findsOneWidget);
      expect(find.text('Size: M'), findsOneWidget);
    });

    testWidgets('should display total price', (tester) async {
      // Add items to cart
      Cart.instance.addItem(CartItem(
        title: 'Product 1',
        price: '£10.00',
        imageUrl: 'assets/test.png',
        color: '',
        size: '',
      ));
      Cart.instance.addItem(CartItem(
        title: 'Product 2',
        price: '£15.00',
        imageUrl: 'assets/test.png',
        color: '',
        size: '',
      ));

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check total price
      expect(find.text('Total: £25.00'), findsOneWidget);
    });

    testWidgets('should display quantity controls', (tester) async {
      Cart.instance.addItem(CartItem(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'assets/test.png',
        color: '',
        size: '',
      ));

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check for quantity buttons
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('should display personalisation details when present', (tester) async {
      Cart.instance.addItem(CartItem(
        title: 'Custom Product',
        price: '£5.00',
        imageUrl: 'assets/test.png',
        color: '',
        size: '',
        personalisationLines: '2 Lines of Text',
        personalisationText: ['Line 1', 'Line 2'],
      ));

      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check for personalisation details
      expect(find.text('Lines: 2 Lines of Text'), findsOneWidget);
      expect(find.text('Line 1: Line 1'), findsOneWidget);
      expect(find.text('Line 2: Line 2'), findsOneWidget);
    });
  });
}
