import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_bunny/core/tb_injector/tb_injector.dart';
import 'package:task_bunny/features/auth/auth.dart';
import 'package:task_bunny/features/features.dart';
import 'package:task_bunny/features/home/home.dart';

import '../../tb_logger/tb_logger.dart';

part 'tb_navigation.g.dart';
part 'tb_routes.dart';

@TypedGoRoute<HomeRoute>(path: TBRoutes.home)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(context, state) => const HomePage();
}

@TypedGoRoute<SignInRoute>(path: TBRoutes.signIn)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(context, state) {
    return BlocProvider(
      create: (_) => di<SignInFormCubit>(),
      child: const SignInPage(),
    );
  }
}

@TypedGoRoute<SignUpRoute>(path: TBRoutes.signUp)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(context, state) {
    return BlocProvider(
      create: (_) => di<SignUpFormCubit>(),
      child: const SignUpPage(),
    );
  }
}

@TypedGoRoute<SplashRoute>(path: TBRoutes.splash)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(context, state) => const SplashPage();
}

final class TBNavigation {
  static const _location = 'TBNavigation';
  static final TBNavigation _instance = TBNavigation._();
  static TBNavigation get instance => _instance;

  final _router = GoRouter(
    routes: $appRoutes,
    initialLocation: TBRoutes.splash,
  );

  TBNavigation._();

  bool get canPop => router.canPop();

  GoRouter get router => _router;

  Future<void> go<T extends Object?>(String location, {Object? extra}) async {
    TBLogger.info(location: _location, message: 'go to $location');
    return _router.go(location, extra: extra);
  }

  Future<void> pop<T extends Object?>([T? result]) async {
    TBLogger.info(location: _location, message: 'pop');
    return _router.pop(result);
  }

  Future<T?> push<T extends Object?>(String location, {Object? extra}) async {
    TBLogger.info(location: _location, message: 'push to $location');
    return _router.push(location, extra: extra);
  }

  void refresh() {
    TBLogger.info(location: _location, message: 'refreshing');
    _router.refresh();
  }
}
