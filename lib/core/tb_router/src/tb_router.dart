import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_bunny/core/tb_injector/tb_injector.dart';
import 'package:task_bunny/core/tb_logger/tb_logger.dart';
import 'package:task_bunny/features/features.dart';

part 'tb_router.g.dart';
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
  FutureOr<bool> onExit(BuildContext context, GoRouterState state) {
    di<SignInFormCubit>().close();
    return super.onExit(context, state);
  }

  @override
  Widget build(context, state) {
    return BlocProvider.value(
      value: di<SignInFormCubit>(),
      child: const SignInPage(),
    );
  }
}

@TypedGoRoute<SignUpRoute>(path: TBRoutes.signUp)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(context, state) {
    return BlocProvider.value(
      value: di<SignUpFormCubit>(),
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

final class TBRouter {
  final AuthBloc _authBloc;

  TBRouter({required AuthBloc authBloc}) : _authBloc = authBloc;

  static const _location = 'TBNavigation';
 
  ValueNotifier<AuthStatus> get status => _authBloc.authStatusNotifier;

  late final _router = GoRouter(
    routes: $appRoutes,
    initialLocation: TBRoutes.splash,
    refreshListenable: _authBloc.authStatusNotifier,
    redirect: (context, state) {
      final isAllowedPath = status.value.allowedPaths.contains(state.fullPath);

      // if (!isOnboarded && !isAllowedPath) return OnboardingRoute.path;

      if (!isAllowedPath) return status.value.redirectPath;

      return null;
    },
  );

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
