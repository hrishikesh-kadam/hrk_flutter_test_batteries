import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
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

    testWidgets('Preset FlutterError.onError', skip: true, (tester) async {
      FlutterExceptionHandler? originalOnError = FlutterError.onError;
      FlutterError.onError = (details) {
        // Ignore that error after resolving the following TODO
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
      // throw FlutterError('Sample FlutterError');
      // TODO(hrishikesh-kadam): Find some code which throw FlutterError()
      // 1. tester.pumpAndSettle()
      expect(tester.takeException(), isFlutterError);
    });
  });
}
