import 'local_file_comparator_with_threshold/io.dart'
    if (dart.library.js_interop) 'local_file_comparator_with_threshold/web.dart'
    as platform;

export 'local_file_comparator_with_threshold/io.dart'
    if (dart.library.js_interop) 'local_file_comparator_with_threshold/web.dart';

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
  platform.useGoldenFileComparatorWithThreshold(threshold);
}
