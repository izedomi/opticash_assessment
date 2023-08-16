import 'base_env.dart';

class DevEnv implements BaseEnv {
  @override
  String get baseUrl => "https://devapi.opticash.io/api/v1";
}
