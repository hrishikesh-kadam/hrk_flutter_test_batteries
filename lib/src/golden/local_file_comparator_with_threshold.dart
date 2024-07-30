import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

/// Uses [LocalFileComparatorWithThreshold] as [goldenFileComparator]
///
/// [threshold] above which tests will be marked as failing.
/// Ranges from 0 to 1, both inclusive.
///
/// References:
/// 1. https://github.com/flutter/flutter/issues/76337
/// 2. https://stackoverflow.com/a/78510535/3302026
/// 3. https://rows.com/blog/post/writing-a-localfilecomparator-with-threshold-for-flutter-golden-tests
/// 4. https://github.com/flutter/flutter/pull/77014
void useGoldenFileComparatorWithThreshold(double threshold) {
  final previousGoldenFileComparator = goldenFileComparator;
  final testUrl = (goldenFileComparator as LocalFileComparator).basedir;
  goldenFileComparator = LocalFileComparatorWithThreshold(
    Uri.parse('$testUrl/just-for-the-sake-of-basedir.dart'),
    threshold,
  );
  addTearDown(() => goldenFileComparator = previousGoldenFileComparator);
}

/// Works just like [LocalFileComparator] but includes a [threshold]
class LocalFileComparatorWithThreshold extends LocalFileComparator {
  /// Threshold to compare with [ComparisonResult.diffPercent].
  ///
  /// Ranges from 0 to 1, both inclusive.
  final double threshold;

  LocalFileComparatorWithThreshold(
    super.testFile,
    this.threshold,
  ) : assert(threshold >= 0 && threshold <= 1);

  /// Same as [LocalFileComparator.compare], but also checks if the
  /// [ComparisonResult.diffPercent] is less than the [threshold].
  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final ComparisonResult result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );

    if (result.passed || result.diffPercent <= threshold) {
      result.dispose();
      return true;
    }

    final String error = await generateFailureOutput(result, golden, basedir);
    result.dispose();
    throw FlutterError(error);
  }
}
