import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> tapBackButton(WidgetTester tester) async {
  await tester.tap(find.byType(BackButton));
  await tester.pumpAndSettle();
}
