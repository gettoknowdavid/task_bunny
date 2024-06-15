import 'package:task_bunny/core/core.dart';

enum AuthStatus {
  unauthenticated(
    redirectPath: TBRoutes.signIn,
    allowedPaths: [TBRoutes.signUp, TBRoutes.signIn],
  ),

  authenticated(
    redirectPath: TBRoutes.home,
    allowedPaths: [TBRoutes.home],
  ),

  unverified(
    redirectPath: '',
    allowedPaths: [],
  );

  const AuthStatus({
    required this.redirectPath,
    required this.allowedPaths,
  });

  /// The target path to redirect when the current route is not allowed in this
  /// auth state.
  final String redirectPath;

  /// List of paths allowed when the app is in this auth state.
  final List<String> allowedPaths;
}
