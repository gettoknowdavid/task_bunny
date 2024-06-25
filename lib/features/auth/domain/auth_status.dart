import 'package:task_bunny/core/core.dart';

enum AuthStatus {
  loading(
    redirectPath: TBRoutes.loading,
    allowedPaths: [TBRoutes.loading],
  ),

  unauthenticated(
    redirectPath: TBRoutes.signIn,
    allowedPaths: [
      TBRoutes.signUp,
      TBRoutes.signIn,
      TBRoutes.forgotPassword,
      TBRoutes.checkYourMail,
    ],
  ),

  authenticated(
    redirectPath: TBRoutes.home,
    allowedPaths: [TBRoutes.home],
  ),

  unverified(
    redirectPath: TBRoutes.verification,
    allowedPaths: [TBRoutes.verification],
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
