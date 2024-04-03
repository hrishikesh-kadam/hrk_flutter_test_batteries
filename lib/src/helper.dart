import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Helper method to precache All Image widgets.
///
/// Image widget fire a asynchronized task to load the image without waiting
/// for its future. There is no direct way to wait for image.
///
/// Source:
/// 1. https://github.com/flutter/flutter/issues/38997#issuecomment-524992589
/// 2. https://github.com/flutter/flutter/issues/38997#issuecomment-555687558
Future<void> precacheAllImages(
  WidgetTester tester,
) async {
  await tester.runAsync(() async {
    for (Element element in find.byType(Image).evaluate()) {
      final Image widget = element.widget as Image;
      final ImageProvider image = widget.image;
      await precacheImage(image, element);
    }
  });
  await tester.pumpAndSettle();
}
