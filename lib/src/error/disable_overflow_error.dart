import 'package:flutter/foundation.dart';
import 'package:hrk_logging/hrk_logging.dart';

import '../global.dart';

/// Note: Overflow error is not always raised (Yet to find reason for that).
void disableOverflowError({
  Logger? logger,
  Level? level,
}) {
  /// FlutterError.onError != FlutterError.presentError in Widget Test
  /// See test/error/disable_overflow_error_test.dart
  FlutterExceptionHandler? originalOnError = FlutterError.onError;
  FlutterError.onError = (details) {
    bool isOverflowError = false;
    final exception = details.exception;
    if (exception is FlutterError) {
      isOverflowError = exception.diagnostics.any(
        (e) => e.value.toString().contains('A RenderFlex overflowed by'),
      );
    }
    if (isOverflowError) {
      level ??= Level.INFO;
      logger ??= packageLogger;
      logger!.log(level!, 'A RenderFlex overflowed');
    } else if (originalOnError != null) {
      originalOnError(details);
    }
  };
}
