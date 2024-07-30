import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('testWidgetsOnError != setUpOnError', () {
    FlutterExceptionHandler? setUpOnError;

    setUp(() {
      setUpOnError = FlutterError.onError;
    });

    testWidgets('test', (widgetTester) async {
      expect(FlutterError.onError != setUpOnError, true);
      expect(FlutterError.onError != FlutterError.presentError, true);
    });
  });

  group('disableOverflowError()', () {
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

    testWidgets('Preset FlutterError.onError', (tester) async {
      FlutterExceptionHandler? originalOnError = FlutterError.onError;
      FlutterError.onError = (details) {
        if (originalOnError != null) {
          originalOnError(details);
        }
      };

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

      // TODO(hrishikesh-kadam): Keep listing code which throws FlutterError()
      // to simplify or exchange the following code
      // 1. tester.pumpAndSettle() doesn't work
      // 2. LocalFileComparator.compare() // works
      const double viewWidth = 100;
      const double viewHeight = 100;
      tester.view.setLogicalSize(width: viewWidth, height: viewHeight);
      await tester.pumpWidget(
        const SizedBox(
          width: viewWidth,
          height: viewHeight,
          child: ColoredBox(
            color: Colors.blue,
          ),
        ),
      );
      await expectLater(
        find.byType(ColoredBox),
        matchesGoldenFile('golden.png'),
      );
      expect(tester.takeException(), isFlutterError);
    });
  });
}
