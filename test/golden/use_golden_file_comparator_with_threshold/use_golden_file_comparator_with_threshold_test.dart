import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('useGoldenFileComparatorWithThreshold()', () {
    const double viewWidth = 100;
    const double viewHeight = 100;

    Widget testWidget() {
      return const SizedBox(
        width: viewWidth,
        height: viewHeight,
        child: ColoredBox(
          color: Colors.blue,
        ),
      );
    }

    // testWidgets('original', (tester) async {
    //   tester.view.setLogicalSize(width: viewWidth, height: viewHeight);
    //   await tester.pumpWidget(testWidget());
    //   await expectLater(
    //     find.byType(ColoredBox),
    //     matchesGoldenFile('original.png'),
    //   );
    // });

    testWidgets('within threshold', (tester) async {
      tester.view.setLogicalSize(width: viewWidth, height: viewHeight);
      await tester.pumpWidget(testWidget());
      useGoldenFileComparatorWithThreshold(0.50); // 50.00%
      await expectLater(
        find.byType(ColoredBox),
        matchesGoldenFile('within-threshold.png'),
      );
    });

    testWidgets('outside threshold', (tester) async {
      tester.view.setLogicalSize(width: viewWidth, height: viewHeight);
      await tester.pumpWidget(testWidget());
      useGoldenFileComparatorWithThreshold(0.74); // 75.00%
      await expectLater(
        find.byType(ColoredBox),
        matchesGoldenFile('outside-threshold.png'),
      );
      expect(tester.takeException(), isFlutterError);
    });
  });
}
