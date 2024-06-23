part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.statusChanged(AuthStatus status) = _StatusChanged;
  const factory AuthEvent.signOut() = _SignOut;
}