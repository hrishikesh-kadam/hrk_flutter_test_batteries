import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('getTestType()', () {
    test('Widget', () {
      expect(getTestType(), 'Widget');
    });
  });
}
