import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: ".env")
final class Env {

  @EnviedField(varName: "API_URL")
  static const String apiUrl = _Env.apiUrl;

  @EnviedField(varName: "API_KEY")
  static const String apiKey = _Env.apiKey;

}