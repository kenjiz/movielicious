import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_ACCESS_TOKEN', obfuscate: true)
  static String apiAccessToken = _Env.apiAccessToken;
}
