import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(useConstantCase: true, requireEnvFile: true)
abstract class Env {
  @EnviedField(obfuscate: true)
  static final String alphaVantageKey = _Env.alphaVantageKey;

  @EnviedField(obfuscate: true)
  static final String twelveDataKey = _Env.twelveDataKey;
}
