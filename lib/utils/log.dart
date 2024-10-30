import 'package:logger/logger.dart';

final class Log {
  static var logger = Logger();
  static void i(String message) {
    logger.d(message);
  }
}
