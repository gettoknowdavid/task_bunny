import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:injectable/injectable.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/domain/domain.dart';
import 'package:task_bunny/utils/utils.dart';

@Injectable(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  late final StreamController<AuthStatus> _authStatusController;

  AuthFacade({
    required firebase_auth.FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth {
    _authStatusController = StreamController<AuthStatus>.broadcast();
    _firebaseAuth.userChanges().listen((user) {
      AuthStatus authStatus;
      if (user == null) {
        authStatus = AuthStatus.unauthenticated;
      } else {
        authStatus = AuthStatus.authenticated;
      }
      _authStatusController.add(authStatus);
    });
  }

  @override
  Stream<AuthStatus> get authStatusChanges => _authStatusController.stream;

  @override
  User? get currentUser => _firebaseAuth.currentUser.toDomain;

  @override
  Future<Either<AuthException, Unit>> signIn({
    required Email email,
    required Password password,
  }) async {
    final emailStr = email.value.getOrElse(() => TBStrings.invalidEmail);
    final pwdStr = password.value.getOrElse(() => TBStrings.invalidPassword);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailStr,
        password: pwdStr,
      );
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return left(AuthException.message(e.message ?? TBStrings.unknownError));
    }
  }

  @override
  Future<void> signOut() => _firebaseAuth.signOut();

  @override
  Future<Either<AuthException, Unit>> signUp({
    required SingleLineString name,
    required Email email,
    required Password password,
  }) async {
    final nameStr = name.value.getOrElse(() => TBStrings.invalidName);
    final emailStr = email.value.getOrElse(() => TBStrings.invalidEmail);
    final pwdStr = password.value.getOrElse(() => TBStrings.invalidPassword);
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailStr,
        password: pwdStr,
      );
      result.user?.updateDisplayName(nameStr);
      await result.user?.reload();
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return left(AuthException.message(e.message ?? TBStrings.unknownError));
    }
  }
}
