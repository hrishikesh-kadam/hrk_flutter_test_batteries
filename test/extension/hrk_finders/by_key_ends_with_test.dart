import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('find.byKeyEndsWith()', () {
    testWidgets('Basic', (tester) async {
      await tester.pumpWidget(const Column(
        key: Key('prefix_row_suffix_key'),
      ));
      expect(find.byKeyEndsWith('suffix_key'), findsOne);
    });
  });
}
