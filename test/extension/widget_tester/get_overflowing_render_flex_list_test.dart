import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('getOverflowingRenderFlexList()', () {
    const overflowingFlexKey = Key('overflowing_flex');
    final overflowingFlexFinder = find.byKey(overflowingFlexKey);

    // Doesn't work. See test/error/disable_overflow_error_test.dart
    // setUp(() {
    //   disableOverflowError();
    // });

    // Doesn't work. See test/error/disable_overflow_error_test.dart
    // setUpAll(() {
    //   disableOverflowError();
    // });

    // setUpAll(() {
    //   configureHrkLogging();
    //   packageLogger.level = Level.ALL;
    // });

    testWidgets('1', (tester) async {
      disableOverflowError();
      tester.view.physicalSize = Size(100, tester.view.physicalSize.height);
      addTearDown(() => tester.view.resetPhysicalSize());
      // Source - https://stackoverflow.com/a/55992910/3302026
      await tester.pumpWidget(const Row(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          SizedBox(width: 110),
        ],
      ));
      final overflowingRenderFlexList = tester.getOverflowingRenderFlexList();
      expect(overflowingRenderFlexList.length, 1);
    });

    testWidgets('0', (tester) async {
      disableOverflowError();
      tester.view.physicalSize = Size(100, tester.view.physicalSize.height);
      addTearDown(() => tester.view.resetPhysicalSize());
      await tester.pumpWidget(const Row(
        key: overflowingFlexKey,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          SizedBox(width: 10),
        ],
      ));
      final overflowingRenderFlexList = tester.getOverflowingRenderFlexList();
      expect(overflowingRenderFlexList.length, 0);
    });

    testWidgets('2', (tester) async {
      disableOverflowError();
      tester.view.physicalSize = Size(100, tester.view.physicalSize.height);
      addTearDown(() => tester.view.resetPhysicalSize());
      await tester.pumpWidget(const Column(
        children: [
          Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              SizedBox(width: 110),
            ],
          ),
          Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              SizedBox(width: 110),
            ],
          ),
        ],
      ));
      final overflowingRenderFlexList = tester.getOverflowingRenderFlexList();
      expect(overflowingRenderFlexList.length, 2);
    });

    testWidgets('of, 2', (tester) async {
      disableOverflowError();
      tester.view.physicalSize = Size(100, tester.view.physicalSize.height);
      addTearDown(() => tester.view.resetPhysicalSize());
      await tester.pumpWidget(const Column(
        children: [
          Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              SizedBox(width: 110),
            ],
          ),
          Column(
            key: overflowingFlexKey,
            children: [
              Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  SizedBox(width: 110),
                ],
              ),
              Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  SizedBox(width: 110),
                ],
              ),
            ],
          ),
        ],
      ));
      final overflowingRenderFlexList = tester.getOverflowingRenderFlexList(
        of: overflowingFlexFinder,
      );
      expect(overflowingRenderFlexList.length, 2);
    });

    testWidgets('of, matchRoot, 1', (tester) async {
      disableOverflowError();
      tester.view.physicalSize = Size(100, tester.view.physicalSize.height);
      addTearDown(() => tester.view.resetPhysicalSize());
      await tester.pumpWidget(const Column(
        children: [
          Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              SizedBox(width: 110),
            ],
          ),
          Row(
            key: overflowingFlexKey,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              SizedBox(width: 110),
            ],
          ),
        ],
      ));
      final overflowingRenderFlexList = tester.getOverflowingRenderFlexList(
        of: overflowingFlexFinder,
        matchRoot: true,
      );
      expect(overflowingRenderFlexList.length, 1);
    });
  });
}
