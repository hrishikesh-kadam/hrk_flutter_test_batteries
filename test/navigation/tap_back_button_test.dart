import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

import '../go_router_example.dart';

void main() {
  testWidgets('tapBackButton()', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(HomeScreen), findsOneWidget);
    await tester.tap(find.widgetWithText(
      ElevatedButton,
      'Go to the Details screen',
    ));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen, skipOffstage: false), findsOneWidget);
    expect(find.byType(DetailsScreen), findsOneWidget);
    await tapBackButton(tester);
    expect(find.byType(DetailsScreen), findsNothing);
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
