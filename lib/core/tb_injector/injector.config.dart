// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import '../../services/network_service.dart' as _i5;
import '../../services/secure_storage_service.dart' as _i6;
import 'register_module.dart' as _i7;

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
    gh.lazySingleton<_i3.FlutterSecureStorage>(
        () => registerModule.flutterSecureStorage);
    gh.lazySingleton<_i4.InternetConnectionChecker>(
        () => registerModule.internetConnectionChecker);
    gh.lazySingleton<_i5.NetworkService>(
        () => _i5.NetworkService(checker: gh<_i4.InternetConnectionChecker>()));
    gh.lazySingleton<_i6.SecureStorageService>(() =>
        _i6.SecureStorageService(storage: gh<_i3.FlutterSecureStorage>()));
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
