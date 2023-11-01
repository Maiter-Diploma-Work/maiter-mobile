import 'package:amica/src/services/auth/auth.service.dart';
import 'package:http/src/response.dart';

class MockAuthService extends AuthService {
  static MockAuthService? _instance;

  static MockAuthService get instance {
    _instance ??= MockAuthService();

    return _instance!;
  }

  @override
  Future<Response> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Response> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
