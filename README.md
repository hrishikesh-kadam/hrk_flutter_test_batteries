[![ci][ci-badge]][ci-link]
[![pub package link][pub-badge]][pub-link]
[![codecov link][codecov-badge]][codecov-link]

A library to accumulate required flutter test helper and utility codes

## Features

- [`getTestType()`]
- [`simulateAndroidBackButton()`]
- [`verifySystemNavigatorPop()`]
- [`disableOverflowError()`]
- [`HrkWidgetTester`]
  - [`getOverflowRenderFlexList()`]
  - [`expectNoOverflow()`]
- [`precacheAllImages()`]
- [`useGoldenFileComparatorWithThreshold()`]

## Convenient Helpers

- [`HrkTestFlutterView`]
  - [`view.setLogicalSize()`]
  - [`view.getLogicalSize()`]

## Getting started

```console
flutter pub add dev:hrk_flutter_test_batteries
```

## Usage

```dart
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  test('$getTestType() Test', () {
    // To know whether in Widget Test or Integration Test.
    // For commands
    //   - flutter test
    //   - flutter test integration_test
    //   - flutter driver
  });

  testWidgets('Simulate Android Back Button', (tester) async {
    // await tester.pumpWidget(deep-link code);
    simulateAndroidBackButton(tester);
    // expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('Pump app and press back', (tester) async {
    // await pumpApp(tester);
    await verifySystemNavigatorPop(tester);
    // To verify pressing back button, leaves the app
  });

  testWidgets('tester.getOverflowRenderFlexList()', (tester) async {
    disableOverflowError();
    tester.view.physicalSize = Size(280, tester.view.physicalSize.height);
    addTearDown(() => tester.view.resetPhysicalSize());
    // await tester.pumpWidget(widget under test);
    final overflowRenderFlexList = tester.getOverflowRenderFlexList();
    expect(overflowRenderFlexList.length, 0);
  });

  testWidgets('tester.expectNoOverflow()', (tester) async {
    disableOverflowError();
    tester.view.physicalSize = Size(280, tester.view.physicalSize.height);
    addTearDown(() => tester.view.resetPhysicalSize());
    // await tester.pumpWidget(widget under test);
    tester.expectNoOverflow();
  });

  testWidgets('tester.view.setLogicalSize()', (tester) async {
    // Saves atleast 3 lines
    // tester.view.physicalSize = Size(280, 653);
    // tester.view.devicePixelRatio = 1.0;
    // addTearDown(() => tester.view.resetPhysicalSize());
    // addTearDown(() => tester.view.resetDevicePixelRatio());
    tester.view.setLogicalSize(width: 280, height: 653);
  });

  testWidgets('useGoldenFileComparatorWithThreshold()', (tester) async {
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
    useGoldenFileComparatorWithThreshold(0.50); // 50.00%
    await expectLater(
      find.byType(ColoredBox),
      matchesGoldenFile('within-threshold.png'),
    );
  });
}
```


[ci-badge]: https://github.com/hrishikesh-kadam/hrk_flutter_test_batteries/actions/workflows/ci.yaml/badge.svg
[ci-link]: https://github.com/hrishikesh-kadam/hrk_flutter_test_batteries/actions/workflows/ci.yaml
[pub-badge]: https://img.shields.io/pub/v/hrk_flutter_test_batteries.svg
[pub-link]: https://pub.dev/packages/hrk_flutter_test_batteries
[codecov-badge]: https://codecov.io/gh/hrishikesh-kadam/hrk_flutter_test_batteries/branch/main/graph/badge.svg
[codecov-link]: https://codecov.io/gh/hrishikesh-kadam/hrk_flutter_test_batteries
[`getTestType()`]: https://pub.dev/documentation/hrk_flutter_test_batteries/latest/hrk_flutter_test_batteries/getTestType.html
[`simulateAndroidBackButton()`]: https://pub.dev/documentation/hrk_flutter_test_batteries/latest/hrk_flutter_test_batteries/simulateAndroidBackButton.html
[`verifySystemNavigatorPop()`]: https://pub.dev/documentation/hrk_flutter_test_batteries/latest/hrk_flutter_test_batteries/verifySystemNavigatorPop.html
[`disableOverflowError()`]: https://pub.dev/documentation/hrk_flutter_test_batteries/latest/hrk_flutter_test_batteries/disableOverflowError.html
[`HrkWidgetTester`]: https://pub.dev/documentation/hrk_flutter_test_batteries/latest/hrk_flutter_test_batteries/HrkWidgetTester.html
[`getOverflowRenderFlexList()`]: https://pub.dev/documentation/hrk_flutter_test_batteries/latest/hrk_flutter_test_batteries/HrkWidgetTester/getOverflowRenderFlexList.html
[`expectNoOverflow()`]: https://pub.dev/documentation/hrk_flutter_test_batteries/latest/hrk_flutter_test_batteries/HrkWidgetTester/expectNoOverflow.html
[`precacheAllImages()`]: https://pub.dev/documentation/hrk_flutter_test_batteries/latest/hrk_flutter_test_batteries/precacheAllImages.html
[`useGoldenFileComparatorWithThreshold()`]: https://pub.dev/documentation/hrk_flutter_test_batteries/latest/hrk_flutter_test_batteries/useGoldenFileComparatorWithThreshold.html
[`HrkTestFlutterView`]: https://pub.dev/documentation/hrk_flutter_test_batteries/latest/hrk_flutter_test_batteries/HrkTestFlutterView.html
[`view.setLogicalSize()`]: https://pub.dev/documentation/hrk_flutter_test_batteries/latest/hrk_flutter_test_batteries/HrkTestFlutterView/setLogicalSize.html
[`view.getLogicalSize()`]: https://pub.dev/documentation/hrk_flutter_test_batteries/latest/hrk_flutter_test_batteries/HrkTestFlutterView/getLogicalSize.html
