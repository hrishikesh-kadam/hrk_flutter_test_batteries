import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('find.byKeyStartsWith()', () {
    testWidgets('Basic', (tester) async {
      await tester.pumpWidget(const Column(
        key: Key('prefix_row_suffix_key'),
      ));
      expect(find.byKeyStartsWith('prefix'), findsOne);
    });

    testWidgets('Index', (tester) async {
      await tester.pumpWidget(const Column(
        key: Key('prefix_row_suffix_key'),
      ));
      expect(find.byKeyStartsWith('suffix', index: 11), findsOne);
    });
  });
}
