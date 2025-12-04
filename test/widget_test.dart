// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:immobilien_makler_web/main.dart';
import 'package:immobilien_makler_web/screens/home_screen.dart';

void main() {
  testWidgets('App starts with home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ImmobilienMaklerApp()); // Изменили MyApp на ImmobilienMaklerApp

    // Проверяем, что приложение запускается
    expect(find.byType(HomeScreen), findsOneWidget); // Проверяем, что HomeScreen отображается
  });
}
