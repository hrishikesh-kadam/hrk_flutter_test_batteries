import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('getTestType()', () {
    test('Widget in test()', () {
      expect(getTestType(), 'Widget');
    });

    testWidgets('Widget in testWidget()', (tester) async {
      expect(getTestType(), 'Widget');
    });

    testWidgets('Integration in testWidgets()', (tester) async {
      expect(getTestType(), 'Integration');
    }, tags: ['get-test-type-integration', 'non-default']);
  });
}
