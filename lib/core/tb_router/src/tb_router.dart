import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_bunny/common/common.dart';
import 'package:task_bunny/core/tb_injector/tb_injector.dart';
import 'package:task_bunny/features/features.dart';

part 'tb_router.g.dart';
part 'tb_routes.dart';

@TypedGoRoute<SplashRoute>(path: TBRoutes.splash)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(context, state) => const SplashPage();
}

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
  Widget build(context, state) => const SignInPage();
}

@TypedGoRoute<SignUpRoute>(path: TBRoutes.signUp)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(context, state) => const SignUpPage();
}

@TypedGoRoute<EmailVerificationRoute>(path: TBRoutes.verification)
class EmailVerificationRoute extends GoRouteData {
  const EmailVerificationRoute();

  @override
  Widget build(context, state) => const EmailVerificationPage();
}

@TypedGoRoute<ForgotPasswordRoute>(path: TBRoutes.forgotPassword)
class ForgotPasswordRoute extends GoRouteData {
  const ForgotPasswordRoute();

  @override
  Widget build(context, state) => const ForgotPasswordPage();
}

@TypedGoRoute<CheckYourMailRoute>(path: TBRoutes.checkYourMail)
class CheckYourMailRoute extends GoRouteData {
  const CheckYourMailRoute();

  @override
  Widget build(context, state) => const CheckYourMailPage();
}

abstract class TBRouter {
  static final routerConfig = GoRouter(
    routes: $appRoutes,
    initialLocation: TBRoutes.home,
    refreshListenable: di<AuthCubit>(),
    redirect: (context, state) {
      final status = di<AuthCubit>().state;
      log('[AppRouter] => $status');
      final isAllowedPath = status.allowedPaths.contains(state.fullPath);
      if (!isAllowedPath) return status.redirectPath;
      return null;
    },
  );

  bool get canPop => routerConfig.canPop();

  static GoRouter of(BuildContext context) => GoRouter.of(context);
}
