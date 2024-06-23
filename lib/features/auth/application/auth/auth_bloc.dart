import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:task_bunny/core/core.dart';
import 'package:task_bunny/features/auth/domain/domain.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _facade;

  late StreamSubscription<AuthStatus> _subscription;

  final authStatusNotifier = ValueNotifier(AuthStatus.unauthenticated);

  AuthBloc({required IAuthFacade facade})
      : _facade = facade,
        super(const _Unauthenticated()) {
    on<_StatusChanged>(_onStatusChanged);
    on<_SignOut>(_onSignOut);

    _subscription = _facade.authStatusChanges.listen(
      (status) {
        TBLogger.info(location: 'AUTH BLOC', message: status.toString());
        add(_StatusChanged(status));
        authStatusNotifier.value = status;
      },
    );
  }

  Future<void> _onSignOut(_SignOut event, Emitter<AuthState> emit) async {}

  void _onStatusChanged(_StatusChanged event, Emitter<AuthState> emit) {
    switch (event.status) {
      case AuthStatus.authenticated:
        emit(const AuthState.authenticated());
        break;
      case AuthStatus.unverified:
        emit(const AuthState.unverified());
        break;
      default:
        emit(const AuthState.unauthenticated());
        break;
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
