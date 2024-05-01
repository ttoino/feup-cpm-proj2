import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(useConstantCase: true)
abstract class Env {
  @EnviedField(defaultValue: 'demo', obfuscate: true)
  static final String apiKey = _Env.apiKey;
}
