import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/domain/domain.dart';

part 'sign_up_form_cubit.freezed.dart';
part 'sign_up_form_state.dart';

@lazySingleton
class SignUpFormCubit extends Cubit<SignUpFormState> {
  final IAuthFacade _facade;
  SignUpFormCubit({required IAuthFacade facade})
      : _facade = facade,
        super(SignUpFormState.initial());

  void emailChanged(String emailStr) {
    emit(state.copyWith(email: Email(emailStr), option: none()));
  }

  void nameChanged(String nameStr) {
    emit(state.copyWith(name: SingleLineString(nameStr), option: none()));
  }

  void passwordChanged(String passwordStr) {
    emit(state.copyWith(password: Password(passwordStr), option: none()));
  }

  Future<void> signUp() async {
    late Either<AuthException, Unit> failureOrSuccess;

    final isNameValid = state.name.isValid;
    final isEmailValid = state.email.isValid;
    final isPasswordValid = state.password.isValid;

    if (isNameValid && isEmailValid && isPasswordValid) {
      emit(state.copyWith(loading: true, option: none()));
      failureOrSuccess = await _facade.signUp(
        name: state.name,
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
}
