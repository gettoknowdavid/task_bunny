import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:task_bunny/features/auth/domain/domain.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthStatus> with ChangeNotifier {
  final IAuthFacade _facade;

  late StreamSubscription<AuthStatus> _subscription;

  AuthCubit({required IAuthFacade facade})
      : _facade = facade,
        super(AuthStatus.loading) {
    _subscription = _facade.authStatusChanges.listen(
      (status) {
        log('Authentication Status => $status');
        emit(status);
        notifyListeners();
      },
    );
  }

  Future<void> signOut() async {
    unawaited(_facade.signOut());
    emit(AuthStatus.unauthenticated);
    notifyListeners();
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
