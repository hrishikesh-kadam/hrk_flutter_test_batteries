import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Source - https://github.com/flutter/packages/blob/010ba5012831a4e02349e31965a0b080d7b44280/packages/go_router/test/test_helpers.dart#L283-L288
Future<void> simulateAndroidBackButton(WidgetTester tester) async {
  final ByteData message =
      const JSONMethodCodec().encodeMethodCall(const MethodCall('popRoute'));
  await tester.binding.defaultBinaryMessenger
      .handlePlatformMessage('flutter/navigation', message, (_) {});
}
