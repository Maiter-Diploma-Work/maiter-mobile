import 'package:amica/src/services/auth/register.service.dart';

class NgrokRegisterService extends RegisterService {
  static NgrokRegisterService? _instance;

  static NgrokRegisterService get instance {
    _instance ??= NgrokRegisterService();

    return _instance!;
  }

  @override
  Future<void> register() {
    // TODO: implement register
    throw UnimplementedError();
  }

}
