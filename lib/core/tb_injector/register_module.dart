import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage {
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker {
    return InternetConnectionChecker();
  }
}
