import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:explorease/loging.page.dart'; // Adjust path to your login file
import 'package:explorease/dashbard.dart'; // Needed to verify navigation

void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    // Build LoginPage widget
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify the welcome text exists
    expect(find.text('Welcome to Explorease'), findsOneWidget);

    // Verify the email and password text fields exist
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.widgetWithIcon(TextField, Icons.email), findsOneWidget);
    expect(find.widgetWithIcon(TextField, Icons.lock), findsOneWidget);

    // Enter text into email and password fields
    await tester.enterText(
        find.widgetWithIcon(TextField, Icons.email), 'test@example.com');
    await tester.enterText(
        find.widgetWithIcon(TextField, Icons.lock), 'password123');

    // Tap the login button
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // After login, DashboardPage should be shown
    expect(find.byType(DashboardPage), findsOneWidget);
  });
}
