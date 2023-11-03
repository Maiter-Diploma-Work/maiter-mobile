import 'package:amica/src/services/auth/auth.service.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';

class MockAuthService extends AuthService {
  static MockAuthService? _instance;

  static MockAuthService get instance {
    _instance ??= MockAuthService();

    return _instance!;
  }

  @override
  Future<Response> register() async {
    return http.Response(
      '',
      200,
    );
  }

  @override
  Future<Response> fillInfo() async {
    return http.Response(
      '',
      200,
    );
  }

  @override
  Future<Response> login() async {
    return http.Response(
      '{ isFilled: true }',
      200,
    );
  }
}
