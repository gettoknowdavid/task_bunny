import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/tb_injector/tb_injector.dart';
import 'package:task_bunny/features/features.dart';

part 'tb_router.g.dart';
part 'tb_routes.dart';

@TypedGoRoute<LoadingRoute>(path: TBRoutes.loading)
class LoadingRoute extends GoRouteData {
  const LoadingRoute();

  @override
  Widget build(context, state) => const Scaffold(body: TBLoadingIndicator());
}

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
    di<SignInFormCubit>().reset();
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

abstract class TBRouter {
  static final routerConfig = GoRouter(
    routes: $appRoutes,
    initialLocation: TBRoutes.splash,
    refreshListenable: di<AuthCubit>(),
    redirect: (context, state) {
      final status = context.read<AuthCubit>().state;
      log('[AppRouter] => $status');
      final isAllowedPath = status.allowedPaths.contains(state.fullPath);
      if (!isAllowedPath) return status.redirectPath;
      return null;
    },
  );

  bool get canPop => routerConfig.canPop();

  static GoRouter of(BuildContext context) => GoRouter.of(context);
}
