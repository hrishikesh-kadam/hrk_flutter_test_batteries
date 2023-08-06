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

  testWidgets('tester.expectNotOverflowing()', (tester) async {
    disableOverflowError();
    tester.view.physicalSize = Size(280, tester.view.physicalSize.height);
    addTearDown(() => tester.view.resetPhysicalSize());
    // await tester.pumpWidget(widget under test);
    tester.expectNotOverflowing();
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
