import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension HrkWidgetTester on WidgetTester {
  /// Returns the overflowing RenderFlex list of descendant Finder.
  /// RenderFlex is the RenderObject of the Flex widgets like Row and Column.
  /// See:
  /// 1. https://docs.flutter.dev/tools/devtools/inspector#flex-layouts
  /// 2. https://docs.flutter.dev/testing/common-errors#a-renderflex-overflowed
  List<RenderFlex> getOverflowingRenderFlexList({
    final Finder? of,
    final bool matchRoot = false,
    final bool skipOffstage = true,
  }) {
    late final Finder flexFinder;
    if (of == null) {
      flexFinder = find.bySubtype<Flex>();
    } else {
      flexFinder = find.descendant(
        of: of,
        matching: find.bySubtype<Flex>(),
        matchRoot: matchRoot,
        skipOffstage: skipOffstage,
      );
    }
    final renderFlexList = renderObjectList<RenderFlex>(flexFinder);
    final overflowingRenderFlexList = <RenderFlex>[];
    for (final renderFlex in renderFlexList) {
      if (renderFlex.toStringShort().contains('OVERFLOWING')) {
        overflowingRenderFlexList.add(renderFlex);
      }
    }
    return overflowingRenderFlexList;
  }

  // TODO(hrishikesh-kadam): Other Overflowing RenderBox:
  // - RenderConstraintsTransformBox
  // See:
  // - https://docs.flutter.dev/ui/layout/constraints Example 14
}
