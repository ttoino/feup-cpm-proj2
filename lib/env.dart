import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(useConstantCase: true, requireEnvFile: true)
abstract class Env {
  @EnviedField(obfuscate: true)
  static final String apiKey = _Env.apiKey;
}
