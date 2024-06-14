import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_bunny/features/features.dart';

part 'tb_navigation.g.dart';
part 'tb_routes.dart';

final class TBNavigation {
  TBNavigation._();

  static final TBNavigation _instance = TBNavigation._();
  static TBNavigation get instance => _instance;

  final _router = GoRouter(
    routes: $appRoutes,
    initialLocation: TBRoutes.splash,
  );

  GoRouter get router => _router;

  bool get canPop => router.canPop();

  Future<T?> push<T extends Object?>(String location, {Object? extra}) async {
    return _router.push(location, extra: extra);
  }

  Future<void> pop<T extends Object?>([T? result]) async {
    return _router.pop(result);
  }

  Future<void> go<T extends Object?>(String location, {Object? extra}) async {
    return _router.go(location, extra: extra);
  }

  void refresh() => _router.refresh();
}

@TypedGoRoute<SplashRoute>(path: TBRoutes.splash)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(context, state) => const SplashPage();
}
