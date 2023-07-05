[![ci](https://github.com/hrishikesh-kadam/hrk_flutter_test_batteries/actions/workflows/ci.yaml/badge.svg)](https://github.com/hrishikesh-kadam/hrk_flutter_test_batteries/actions/workflows/ci.yaml)
[![codecov](https://codecov.io/gh/hrishikesh-kadam/hrk_flutter_test_batteries/branch/main/graph/badge.svg)](https://codecov.io/gh/hrishikesh-kadam/hrk_flutter_test_batteries)
[![pub package](https://img.shields.io/pub/v/hrk_flutter_test_batteries.svg)](https://pub.dev/packages/hrk_flutter_test_batteries)

A library to accumulate required flutter test helper and utility codes

## Features

- `getTestType()`
- `simulateAndroidBackButton(tester)`
- `verifySystemNavigatorPop(tester)`

## Getting started

```console
flutter pub add dev:hrk_flutter_test_batteries
```

## Usage

```dart
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
}

```
