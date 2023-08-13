import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension HrkTestFlutterView on TestFlutterView {
  /// Sets physicalSize, devicePixelRatio and adds reset code to tearDown
  void setLogicalSize({
    double? width,
    double? height,
  }) {
    physicalSize = Size(
      width ?? physicalSize.width / devicePixelRatio,
      height ?? physicalSize.height / devicePixelRatio,
    );
    devicePixelRatio = 1.0;
    addTearDown(() => resetPhysicalSize());
    addTearDown(() => resetDevicePixelRatio());
  }

  Size getLogicalSize() {
    return Size(
      physicalSize.width / devicePixelRatio,
      physicalSize.height / devicePixelRatio,
    );
  }
}
