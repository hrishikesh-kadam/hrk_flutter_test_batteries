import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  testWidgets('verifySystemNavigatorPop()', (tester) async {
    await tester.pumpWidget(const MaterialApp());
    await verifySystemNavigatorPop(tester);
  });
}
