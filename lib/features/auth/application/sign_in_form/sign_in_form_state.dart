part of 'sign_in_form_cubit.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required Email email,
    required Password password,
    required bool showErrorMessage,
    required bool loading,
    required Option<Either<AuthException, Unit>> option,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        email: Email(''),
        password: Password(''),
        showErrorMessage: false,
        loading: false,
        option: none(),
      );
}
