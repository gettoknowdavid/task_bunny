import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@lazySingleton
final class NetworkService {
  final InternetConnectionChecker _checker;

  NetworkService({required InternetConnectionChecker checker})
      : _checker = checker;

  Future<bool> get isConnected => _checker.hasConnection;

  Stream<bool> get isConnectedStream => _checker.onStatusChange
      .map((status) => status == InternetConnectionStatus.connected);
}
