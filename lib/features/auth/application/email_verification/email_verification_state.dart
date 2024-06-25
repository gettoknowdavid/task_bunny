part of 'email_verification_cubit.dart';

@freezed
class EmailVerificationState with _$EmailVerificationState {
  const factory EmailVerificationState.initial() = _Initial;
  const factory EmailVerificationState.verificationInProgress() = _VerificationInProgress;
  const factory EmailVerificationState.verificationMailSent() = _VerificationMailSent;
  const factory EmailVerificationState.verificationSuccess() = _VerificationSuccess;
  const factory EmailVerificationState.verificationFailure(AuthException exception) = _VerificationFailure;
  const factory EmailVerificationState.verificationCancelled() = _VerificationCancelled;
}
