import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_bunny/features/features.dart';

import '../../tb_logger/tb_logger.dart';

part 'tb_navigation.g.dart';
part 'tb_routes.dart';

final class TBNavigation {
  TBNavigation._();

  static const _location = 'TBNavigation';
  static final TBNavigation _instance = TBNavigation._();
  static TBNavigation get instance => _instance;

  final _router = GoRouter(
    routes: $appRoutes,
    initialLocation: TBRoutes.splash,
  );

  GoRouter get router => _router;

  bool get canPop => router.canPop();

  Future<T?> push<T extends Object?>(String location, {Object? extra}) async {
    TBLogger.info(location: _location, message: 'push to $location');
    return _router.push(location, extra: extra);
  }

  Future<void> pop<T extends Object?>([T? result]) async {
    TBLogger.info(location: _location, message: 'pop');
    return _router.pop(result);
  }

  Future<void> go<T extends Object?>(String location, {Object? extra}) async {
    TBLogger.info(location: _location, message: 'go to $location');
    return _router.go(location, extra: extra);
  }

  void refresh() {
    TBLogger.info(location: _location, message: 'refreshing');
    _router.refresh();
  }
}

@TypedGoRoute<SplashRoute>(path: TBRoutes.splash)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(context, state) => const SplashPage();
}
