import 'package:amica/src/services/api_url.dart';
import 'package:amica/src/services/auth/auth.service.dart';
import 'package:http/http.dart' as http;

class NgrokAuthService extends AuthService {
  static NgrokAuthService? _instance;

  static NgrokAuthService get instance {
    _instance ??= NgrokAuthService();

    return _instance!;
  }

  @override
  Future<http.Response> register() async {
    Uri url = Uri.https(apiUrl, 'api/auth/register');
    http.Response response = await http.post(url, body: {
      ...personalInfoForm.value,
      ...goalForm.value,
      'interests': selectedInterests,
      'favoriteSong': favoriteSong,
    });

    return response;
  }

  @override
  Future<http.Response> login() {
    // TODO: implement login
    throw UnimplementedError();
  }
}
