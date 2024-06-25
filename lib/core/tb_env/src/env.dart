import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'GOOGLE_CLIENT_ID')
  static final String googleClientID = _Env.googleClientID;
}
