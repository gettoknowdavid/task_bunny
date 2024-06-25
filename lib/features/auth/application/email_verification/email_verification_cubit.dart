import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_bunny/features/auth/domain/domain.dart';
import 'package:task_bunny/services/mail_service.dart';

part 'email_verification_cubit.freezed.dart';
part 'email_verification_state.dart';

@lazySingleton
class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  final IAuthFacade _facade;
  final MailService _mailService;

  late StreamSubscription<AuthStatus> _subscription;
  Timer? _timer;

  EmailVerificationCubit({
    required IAuthFacade facade,
    required MailService mailService,
  })  : _facade = facade,
        _mailService = mailService,
        super(const EmailVerificationState.initial()) {
    _subscription = _facade.authStatusChanges.listen((status) {
      if (status == AuthStatus.unverified) {
        _timer = Timer.periodic(const Duration(seconds: 5), (_) async {
          await checkEmailVerified();
        });
      }
    });
  }

  Future<void> cancel() async {
    emit(const EmailVerificationState.verificationInProgress());
    unawaited(_facade.signOut());
    emit(const EmailVerificationState.verificationCancelled());
  }

  Future<void> checkEmailVerified() async {
    final verificationOption = await _facade.checkEmailVerified();
    verificationOption.fold(
      () => null,
      (_) => const EmailVerificationState.verificationSuccess(),
    );
  }

  Future<void> openMailApp(BuildContext context) {
    return _mailService.openMailApp(context);
  }

  Future<void> sendVerificationEmail() async {
    emit(const EmailVerificationState.verificationInProgress());
    final failureOrSuccess = await _facade.sendVerificationEmail();
    failureOrSuccess.fold(
      (failure) => emit(EmailVerificationState.verificationFailure(failure)),
      (success) => const EmailVerificationState.verificationMailSent(),
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    _timer?.cancel();
    return super.close();
  }
}
