import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/domain/domain.dart';

extension FirebaseUserX on firebase_auth.User? {
  User? get toDomain {
    if (this == null) return null;

    return User(
      uid: UniqueID.fromUniqueString(this!.uid),
      name: SingleLineString(this!.displayName!),
      email: Email(this!.email!),
      photoURL: ProfilePicture(this?.photoURL),
    );
  }
}
