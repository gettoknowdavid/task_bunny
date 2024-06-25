import 'dart:async';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'app_tb.dart';
import 'core/core.dart';
import 'features/auth/auth.dart';
import 'firebase_options.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  configureDependencies();
  runApp(
    ChangeNotifierProvider(
      create: (context) => di<AuthCubit>(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di<AuthCubit>()),
          BlocProvider(create: (_) => di<SignInFormCubit>()),
          BlocProvider(create: (_) => di<SignUpFormCubit>()),
          BlocProvider(create: (_) => di<EmailVerificationCubit>()),
          BlocProvider(create: (_) => di<ForgotPasswordFormCubit>()),
        ],
        child: const AppTB(),
      ),
    ),
  );
}
