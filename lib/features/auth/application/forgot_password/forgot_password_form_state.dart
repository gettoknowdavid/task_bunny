part of 'forgot_password_form_cubit.dart';

@freezed
class ForgotPasswordFormState with _$ForgotPasswordFormState {
  const factory ForgotPasswordFormState({
    required Email email,
    required bool showErrorMessage,
    required bool loading,
    required Option<Either<AuthException, Unit>> option,
  }) = _ForgotPasswordFormState;

  factory ForgotPasswordFormState.initial() => ForgotPasswordFormState(
        email: Email(''),
        showErrorMessage: false,
        loading: false,
        option: none(),
      );
}
