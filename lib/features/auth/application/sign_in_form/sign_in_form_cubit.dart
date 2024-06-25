import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_bunny/features/auth/domain/domain.dart';

part 'sign_in_form_cubit.freezed.dart';
part 'sign_in_form_state.dart';

@lazySingleton
class SignInFormCubit extends Cubit<SignInFormState> {
  final IAuthFacade _facade;
  SignInFormCubit({required IAuthFacade facade})
      : _facade = facade,
        super(SignInFormState.initial());

  void emailChanged(String emailStr) {
    emit(state.copyWith(email: Email(emailStr), option: none()));
  }

  void passwordChanged(String passwordStr) {
    emit(state.copyWith(
      password: Password(passwordStr, isSignIn: true),
      option: none(),
    ));
  }

  Future<void> signIn() async {
    late Either<AuthException, Unit> failureOrSuccess;
    final isEmailValid = state.email.isValid;
    final isPasswordValid = state.password.isValid;
    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(loading: true, option: none()));
      failureOrSuccess = await _facade.signIn(
        email: state.email,
        password: state.password,
      );
    }
    emit(state.copyWith(
      showErrorMessage: false,
      loading: false,
      option: optionOf(failureOrSuccess),
    ));
  }

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(googleSignInLoading: true, option: none()));
    final failureOrSuccess = await _facade.signInWithGoogle();
    emit(state.copyWith(
      showErrorMessage: false,
      googleSignInLoading: false,
      option: optionOf(failureOrSuccess),
    ));
  }
}
