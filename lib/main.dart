import 'dart:async';

import 'package:flutter/material.dart';

import 'app_tb.dart';
import 'core/core.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializes all dependencies before running the application
  configureDependencies();
  
  runApp(const AppTB());
}
