import 'dart:developer';

import 'package:flutter/material.dart';

final class TBLogger {
  static const _enableDebug = false;

  TBLogger._();

  static void debug({required String location, required String message}) {
    if (_enableDebug) {
      _log(
        level: _LogLevel.debug,
        emoji: '👁️',
        location: location,
        message: message,
        useLog: false,
      );
    }
  }

  static void error({
    required String location,
    required String message,
    Object? errorObject,
    StackTrace? stackTrace,
  }) {
    _log(
      level: _LogLevel.error,
      emoji: '🔴',
      location: location,
      message: message,
      errorObject: errorObject,
      stackTrace: stackTrace,
    );
  }

  static void info({required String location, required String message}) {
    _log(
      level: _LogLevel.info,
      emoji: 'ℹ️',
      location: location,
      message: message,
    );
  }

  static void _log({
    required _LogLevel level,
    required String emoji,
    required String location,
    required String message,
    Object? errorObject,
    StackTrace? stackTrace,
    bool useLog = true,
  }) {
    String logMessage = '[${level.label} $emoji][$location]: $message';

    if (level == _LogLevel.error && errorObject != null) {
      logMessage += '\nError: $errorObject';
      if (stackTrace != null) logMessage += '\nStackTrace: $stackTrace';
    }

    if (useLog) {
      log(logMessage);
      return;
    }

    debugPrint(logMessage);
  }
}

enum _LogLevel {
  debug(label: 'DEBUG'),
  error(label: 'ERROR'),
  info(label: 'INFO');

  final String label;

  const _LogLevel({required this.label});
}
