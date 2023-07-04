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
