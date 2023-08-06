import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_flutter_test_batteries/hrk_flutter_test_batteries.dart';

void main() {
  group('tester.expectNotOverflowing()', () {
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
      try {
        tester.expectNotOverflowing();
      } catch (e) {
        expect(e, isInstanceOf<TestFailure>());
      }
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
      tester.expectNotOverflowing();
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
      try {
        tester.expectNotOverflowing();
      } catch (e) {
        expect(e, isInstanceOf<TestFailure>());
      }
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
      try {
        tester.expectNotOverflowing(of: overflowingFlexFinder);
      } catch (e) {
        expect(e, isInstanceOf<TestFailure>());
      }
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
      try {
        tester.expectNotOverflowing(
          of: overflowingFlexFinder,
          matchRoot: true,
        );
      } catch (e) {
        expect(e, isInstanceOf<TestFailure>());
      }
    });
  });
}
