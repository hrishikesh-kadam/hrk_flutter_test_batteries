[![ci](https://github.com/hrishikesh-kadam/hrk_flutter_test_batteries/actions/workflows/ci.yaml/badge.svg)](https://github.com/hrishikesh-kadam/hrk_flutter_test_batteries/actions/workflows/ci.yaml)
[![codecov](https://codecov.io/gh/hrishikesh-kadam/hrk_flutter_test_batteries/branch/main/graph/badge.svg)](https://codecov.io/gh/hrishikesh-kadam/hrk_flutter_test_batteries)
[![pub package](https://img.shields.io/pub/v/hrk_flutter_test_batteries.svg)](https://pub.dev/packages/hrk_flutter_test_batteries)

A library to accumulate required flutter test helper and utility codes

## Features

- [`getTestType()`][]
- [`simulateAndroidBackButton(tester)`][]
- [`verifySystemNavigatorPop(tester)`][]
- [`disableOverflowError()`][]
- [`tester.getOverflowingRenderFlexList()`][]

## Convenient Helpers

- [`tester.view.setPhysicalSize()`][]

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

  testWidgets('tester.getOverflowingRenderFlexList()', (tester) async {
    disableOverflowError();
    tester.view.physicalSize = Size(280, tester.view.physicalSize.height);
    addTearDown(() => tester.view.resetPhysicalSize());
    // await tester.pumpWidget(widget under test);
    final overflowingRenderFlexList = tester.getOverflowingRenderFlexList();
    expect(overflowingRenderFlexList.length, 0);
  });

  testWidgets('tester.view.setLogicalSize()', (tester) async {
    // Saves atleast 3 lines
    // tester.view.physicalSize = Size(280, 653);
    // tester.view.devicePixelRatio = 1.0;
    // addTearDown(() => tester.view.resetPhysicalSize());
    // addTearDown(() => tester.view.resetDevicePixelRatio());
    tester.view.setLogicalSize(width: 280, height: 653);
  });
}
```


[`getTestType()`]: lib/src/test_type.dart
[`simulateAndroidBackButton(tester)`]: lib/src/navigation/simulate_android_back_button.dart
[`verifySystemNavigatorPop(tester)`]: lib/src/navigation/verify_system_navigator_pop.dart
[`disableOverflowError()`]: lib/src/error/disable_overflow_error.dart
[`tester.getOverflowingRenderFlexList()`]: lib/src/extension/widget_tester.dart
[`tester.view.setPhysicalSize()`]: lib/src/extension/test_flutter_view.dart
