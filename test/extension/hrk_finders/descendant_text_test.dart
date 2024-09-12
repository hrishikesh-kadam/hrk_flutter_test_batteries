import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('find.descendantText()', () {
    testWidgets('Basic', (tester) async {
      await tester.pumpWidget(const Column(
        key: Key('outer_column_key'),
        children: [
          Column(
            key: Key('inner_column_key'),
            children: [
              Text(
                'Lorem ipsum',
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
          Text(
            'Lorem ipsum',
            textDirection: TextDirection.ltr,
          ),
        ],
      ));
      expect(
        find.descendantText(
          of: find.byKey(const Key('inner_column_key')),
          text: 'Lorem ipsum',
        ),
        findsOne,
      );
      expect(
        find.descendantText(
          of: find.byKey(const Key('outer_column_key')),
          text: 'Lorem ipsum',
        ),
        findsNWidgets(2),
      );
    });
  });
}
