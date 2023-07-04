import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('getTestType()', () {
    test('Integration in test()', () {
      expect(getTestType(), 'Integration');
    });

    testWidgets('Integration in testWidgets()', (tester) async {
      expect(getTestType(), 'Integration');
    });
  });
}
