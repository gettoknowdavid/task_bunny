import 'package:dartz/dartz.dart';
import 'package:task_bunny/core/core.dart';

import 'auth_exception.dart';
import 'auth_status.dart';
import 'entities/entities.dart';
import 'value_objects/value_objects.dart';

abstract class IAuthFacade {
  Stream<AuthStatus> get authStatusChanges;

  User? get currentUser;

  Future<Option<Unit>> checkEmailVerified();

  Future<Either<AuthException, Unit>> signIn({
    required Email email,
    required Password password,
  });

  Future<void> signOut();

  Future<Either<AuthException, Unit>> signUp({
    required SingleLineString name,
    required Email email,
    required Password password,
  });

  Future<Either<AuthException, Unit>> sendVerificationEmail();
}
