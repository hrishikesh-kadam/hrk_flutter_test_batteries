import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('TestFlutterView setPhysicalSize()', () {
    testWidgets('Width', (tester) async {
      final existingWidth = tester.view.physicalSize.width;
      final existingHeight = tester.view.physicalSize.height;
      tester.view.setPhysicalSize(width: 280);
      expect(tester.view.physicalSize.width != existingWidth, true);
      expect(tester.view.physicalSize.height == existingHeight, true);
    });

    testWidgets('Height', (tester) async {
      final existingWidth = tester.view.physicalSize.width;
      final existingHeight = tester.view.physicalSize.height;
      tester.view.setPhysicalSize(height: 653);
      expect(tester.view.physicalSize.width == existingWidth, true);
      expect(tester.view.physicalSize.height != existingHeight, true);
    });
  });
}
