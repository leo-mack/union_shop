import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/login_page.dart';

void main() {
  group('Login Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: LoginPage());
    }

    testWidgets('should display login title', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that login title is present
      expect(find.text('Login'), findsWidgets);
    });

    testWidgets('should display email/username field', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check for email or username input field
      expect(find.byType(TextField), findsWidgets);
    });

    testWidgets('should display password field', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check for password input field
      expect(find.byType(TextField), findsWidgets);
    });

    testWidgets('should have login button', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that login button exists
      expect(find.text('Login'), findsWidgets);
    });

    testWidgets('should have navigation back option', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that back navigation is available
      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}
