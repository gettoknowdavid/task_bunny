part of 'sign_up_form_cubit.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    required SingleLineString name,
    required Email email,
    required Password password,
    required bool showErrorMessage,
    required bool loading,
    required Option<Either<AuthException, Unit>> option,
  }) = _SignUpFormState;

  factory SignUpFormState.initial() => SignUpFormState(
        name: SingleLineString(''),
        email: Email(''),
        password: Password(''),
        showErrorMessage: false,
        loading: false,
        option: none(),
      );
}
