import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('precacheAllImages()', () {
    const double viewWidth = 200;
    const double viewHeight = 72 + 48 + 16 + 48;

    Widget testWidget() {
      return Column(
        children: [
          Image.asset(
            'test/assets/play-store-badge.png',
            height: 72,
          ),
          SvgPicture.asset(
            'test/assets/app-store-black-badge.svg',
            height: 48,
          ),
          const SizedBox(height: 16),
          Image.asset(
            'test/assets/flutter-logomark.png',
            height: 48,
          ),
        ],
      );
    }

    setUp(() {
      // TODO(hrishikesh-kadam): pre-cached differs by 11.88% in beta 3.24.0-0.2.pre
      useGoldenFileComparatorWithThreshold(0.12);
    });

    testWidgets('not pre-cached', (tester) async {
      tester.view.setLogicalSize(width: viewWidth, height: viewHeight);
      await tester.pumpWidget(testWidget());
      await expectLater(
        find.byType(Column),
        matchesGoldenFile('not-pre-cached.jpg'),
      );
    });

    testWidgets('pre-cached', (tester) async {
      tester.view.setLogicalSize(width: viewWidth, height: viewHeight);
      await tester.pumpWidget(testWidget());
      await precacheAllImages(tester);
      await expectLater(
        find.byType(Column),
        matchesGoldenFile('pre-cached.jpg'),
      );
    });
  });
}
