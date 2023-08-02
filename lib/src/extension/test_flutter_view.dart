import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension HrkTestFlutterView on TestFlutterView {
  /// Sets physicalSize and adds reset code to tearDown
  void setPhysicalSize({
    double? width,
    double? height,
  }) {
    physicalSize = Size(
      width ?? physicalSize.width,
      height ?? physicalSize.height,
    );
    devicePixelRatio = 1.0;
    addTearDown(() => resetPhysicalSize());
    addTearDown(() => resetDevicePixelRatio());
  }
}
