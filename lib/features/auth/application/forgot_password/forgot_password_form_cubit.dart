import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_bunny/features/auth/domain/domain.dart';
import 'package:task_bunny/services/mail_service.dart';

part 'forgot_password_form_cubit.freezed.dart';
part 'forgot_password_form_state.dart';

@lazySingleton
class ForgotPasswordFormCubit extends Cubit<ForgotPasswordFormState> {
  final IAuthFacade _facade;
  final MailService _mailService;
  ForgotPasswordFormCubit({
    required IAuthFacade facade,
    required MailService mailService,
  })  : _facade = facade,
        _mailService = mailService,
        super(ForgotPasswordFormState.initial());

  void emailChanged(String emailStr) {
    emit(state.copyWith(email: Email(emailStr), option: none()));
  }

  Future<void> openMailApp(BuildContext context) {
    return _mailService.openMailApp(context);
  }

  Future<void> sendResetPasswordLink() async {
    late Either<AuthException, Unit> failureOrSuccess;

    final isEmailValid = state.email.isValid;

    if (isEmailValid) {
      emit(state.copyWith(loading: true, option: none()));
      failureOrSuccess = await _facade.sendPasswordResetEmail(state.email);
    }

    emit(state.copyWith(
      showErrorMessage: false,
      loading: false,
      option: optionOf(failureOrSuccess),
    ));
  }
}
