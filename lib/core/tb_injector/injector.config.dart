// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i6;

import '../../features/auth/application/auth_cubit.dart' as _i12;
import '../../features/auth/application/email_verification/email_verification_cubit.dart'
    as _i15;
import '../../features/auth/application/forgot_password/forgot_password_form_cubit.dart'
    as _i16;
import '../../features/auth/application/sign_in_form/sign_in_form_cubit.dart'
    as _i13;
import '../../features/auth/application/sign_up_form/sign_up_form_cubit.dart'
    as _i14;
import '../../features/auth/domain/domain.dart' as _i8;
import '../../features/auth/infrastructure/auth_facade.dart' as _i9;
import '../../services/mail_service.dart' as _i7;
import '../../services/network_service.dart' as _i10;
import '../../services/secure_storage_service.dart' as _i11;
import 'register_module.dart' as _i17;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i4.FlutterSecureStorage>(
        () => registerModule.flutterSecureStorage);
    gh.lazySingleton<_i5.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i6.InternetConnectionChecker>(
        () => registerModule.internetConnectionChecker);
    gh.lazySingleton<_i7.MailService>(() => _i7.MailService());
    gh.factory<_i8.IAuthFacade>(() => _i9.AuthFacade(
          firebaseAuth: gh<_i3.FirebaseAuth>(),
          googleSignIn: gh<_i5.GoogleSignIn>(),
        ));
    gh.lazySingleton<_i10.NetworkService>(() =>
        _i10.NetworkService(checker: gh<_i6.InternetConnectionChecker>()));
    gh.lazySingleton<_i11.SecureStorageService>(() =>
        _i11.SecureStorageService(storage: gh<_i4.FlutterSecureStorage>()));
    gh.lazySingleton<_i12.AuthCubit>(
        () => _i12.AuthCubit(facade: gh<_i8.IAuthFacade>()));
    gh.lazySingleton<_i13.SignInFormCubit>(
        () => _i13.SignInFormCubit(facade: gh<_i8.IAuthFacade>()));
    gh.lazySingleton<_i14.SignUpFormCubit>(
        () => _i14.SignUpFormCubit(facade: gh<_i8.IAuthFacade>()));
    gh.lazySingleton<_i15.EmailVerificationCubit>(
        () => _i15.EmailVerificationCubit(
              facade: gh<_i8.IAuthFacade>(),
              mailService: gh<_i7.MailService>(),
            ));
    gh.lazySingleton<_i16.ForgotPasswordFormCubit>(
        () => _i16.ForgotPasswordFormCubit(
              facade: gh<_i8.IAuthFacade>(),
              mailService: gh<_i7.MailService>(),
            ));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
