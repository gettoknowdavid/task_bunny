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
    _checkUserChanges();
  }

  @override
  Stream<AuthStatus> get authStatusChanges => _authStatusController.stream;

  @override
  User? get currentUser => _firebaseAuth.currentUser.toDomain;

  @override
  Future<Option<Unit>> checkEmailVerified() async {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser == null) {
      return optionOf(null);
    }

    await firebaseUser.reload();

    if (firebaseUser.emailVerified) {
      return optionOf(unit);
    } else {
      return optionOf(null);
    }
  }

  @override
  Future<Either<AuthException, Unit>> sendPasswordResetEmail(
    Email email,
  ) async {
    final emailStr = email.value.getOrElse(() => TBStrings.invalidEmail);
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: emailStr);
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return left(AuthException.message(e.message ?? TBStrings.unknownError));
    }
  }

  @override
  Future<Either<AuthException, Unit>> sendVerificationEmail() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        return right(unit);
      } else {
        return left(const AuthException.message('You are not signed in'));
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      return left(AuthException.message(e.message ?? TBStrings.unknownError));
    }
  }

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

  void _checkUserChanges() {
    _firebaseAuth.userChanges().listen((user) {
      AuthStatus authStatus;
      if (user == null) {
        authStatus = AuthStatus.unauthenticated;
      } else if (user.emailVerified) {
        authStatus = AuthStatus.authenticated;
      } else {
        authStatus = AuthStatus.unverified;
      }
      _authStatusController.add(authStatus);
    });
  }
}
