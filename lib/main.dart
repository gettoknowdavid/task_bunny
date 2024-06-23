import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_tb.dart';
import 'core/core.dart';
import 'features/auth/auth.dart';
import 'firebase_options.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initializes all dependencies before running the application
  configureDependencies();

  runApp(
    BlocProvider(
      create: (context) => di<AuthBloc>(),
      child:  const AppTB( ),
    ),
  );
}
