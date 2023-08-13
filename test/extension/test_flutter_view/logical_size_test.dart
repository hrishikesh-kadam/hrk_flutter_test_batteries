import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('TestFlutterView logicalSize', () {
    testWidgets('Width', (tester) async {
      final double physicalWidth = tester.view.physicalSize.width;
      final double physicalHeight = tester.view.physicalSize.height;
      const double logicalWidth = 800;
      const double logicalHeight = 600;
      tester.view.setLogicalSize(width: logicalWidth);
      expect(tester.view.physicalSize.width != physicalWidth, true);
      expect(tester.view.physicalSize.height != physicalHeight, true);
      expect(tester.view.physicalSize.width == logicalWidth, true);
      expect(tester.view.physicalSize.height == logicalHeight, true);
      expect(tester.view.physicalSize == tester.view.getLogicalSize(), true);
    });

    testWidgets('Height', (tester) async {
      final double physicalWidth = tester.view.physicalSize.width;
      final double physicalHeight = tester.view.physicalSize.height;
      const double logicalWidth = 800;
      const double logicalHeight = 600;
      tester.view.setLogicalSize(height: logicalHeight);
      expect(tester.view.physicalSize.width != physicalWidth, true);
      expect(tester.view.physicalSize.height != physicalHeight, true);
      expect(tester.view.physicalSize.width == logicalWidth, true);
      expect(tester.view.physicalSize.height == logicalHeight, true);
      expect(tester.view.physicalSize == tester.view.getLogicalSize(), true);
    });

    testWidgets('Both', (tester) async {
      final double physicalWidth = tester.view.physicalSize.width;
      final double physicalHeight = tester.view.physicalSize.height;
      const double logicalWidth = 280;
      const double logicalHeight = 653;
      tester.view.setLogicalSize(width: logicalWidth, height: logicalHeight);
      expect(tester.view.physicalSize.width != physicalWidth, true);
      expect(tester.view.physicalSize.height != physicalHeight, true);
      expect(tester.view.physicalSize.width == logicalWidth, true);
      expect(tester.view.physicalSize.height == logicalHeight, true);
      expect(tester.view.physicalSize == tester.view.getLogicalSize(), true);
    });
  });
}
