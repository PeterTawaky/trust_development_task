import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static var logger = Logger();

  static void trace(String message) {
    if (kDebugMode) {
      logger.t(message);
    }
  }

  static void debug(String message) {
    if (kDebugMode) {
      logger.d(message);
    }
  }

  static void info(String message) {
    if (kDebugMode) {
      logger.i(message);
    }
  }

  static void error(String message) {
    if (kDebugMode) {
      logger.e(message);
    }
  }
}
