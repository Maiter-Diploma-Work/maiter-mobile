import 'package:amica/src/services/auth/register.service.dart';

class MockRegisterService extends RegisterService {
  static MockRegisterService? _instance;

  static MockRegisterService get instance {
    _instance ??= MockRegisterService();

    return _instance!;
  }

  @override
  Future<void> register() async {
    //TODO: Mock HTTP request?
  }
}
