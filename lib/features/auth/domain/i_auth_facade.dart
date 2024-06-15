import 'package:dartz/dartz.dart';
import 'package:task_bunny/core/core.dart';

import 'auth_exception.dart';
import 'entities/entities.dart';
import 'value_objects/value_objects.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();

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
}
