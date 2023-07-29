import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

// Used in:
// 1. https://stackoverflow.com/a/76795216/3302026

void main() {
  group('disableOverflowError()', () {
    // Doesn't work. See test/error/disable_overflow_error_test.dart
    // setUp(() {
    //   disableOverflowError();
    // });

    // Doesn't work. See test/error/disable_overflow_error_test.dart
    // setUpAll(() {
    //   disableOverflowError();
    // });

    // setUpAll(() {
    //   configureHrkLogging();
    //   packageLogger.level = Level.ALL;
    // });

    testWidgets('Included', (tester) async {
      disableOverflowError();
      tester.view.physicalSize = Size(100, tester.view.physicalSize.height);
      addTearDown(() => tester.view.resetPhysicalSize());
      await tester.pumpWidget(const Row(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          SizedBox(width: 110),
        ],
      ));
      expect(tester.takeException(), isNull);
    });

    testWidgets('Not included', (tester) async {
      tester.view.physicalSize = Size(100, tester.view.physicalSize.height);
      addTearDown(() => tester.view.resetPhysicalSize());
      await tester.pumpWidget(const Row(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          SizedBox(width: 110),
        ],
      ));
      expect(tester.takeException(), isFlutterError);
    });
  });
}
