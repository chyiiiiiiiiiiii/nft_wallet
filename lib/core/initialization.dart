import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

import 'injection/injection_container.dart';

Future<void> init() async {
  initEquatable();

  await initInjection();
}

/// [ Equatable ] model class will auto set stringify 'true', and have toString() to show content
void initEquatable() {
  EquatableConfig.stringify = true;
}

/// [ Logger ]
final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, // number of method calls to be displayed
    errorMethodCount: 8, // number of method calls if stacktrace is provided
    lineLength: 120, // width of the output
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
    printTime: false, // Should each log print contain a timestamp
  ),
);
