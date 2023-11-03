import 'dart:convert';

import 'package:amica/src/services/api_url.dart';
import 'package:amica/src/stores/user_store/actions/user_login.action.dart';
import 'package:http/http.dart' as http;
import 'package:rx_redux/rx_redux.dart';
import 'package:rxdart/rxdart.dart';

class UserLoginEffect {
  static late http.Response _registerResponse;

  static void _register(UserLoginAction action) async {
    _registerResponse = await http.post(
      Uri.parse('$apiUrl/api/auth/login'),
      body: jsonEncode(action),
    );
  }

  static SideEffect get effect {
    return (actions, getState) =>
        actions.whereType<UserLoginAction>().switchMap((action) {
          _register(action);

          switch (_registerResponse.statusCode) {
            case 200:
              var body = jsonDecode(_registerResponse.body);
              return Stream.value(
                UserLoginSuccessAction(
                  id: body['id'],
                  token: body['token'],
                ),
              );
            default:
              return Stream.value(
                UserLoginFailureAction(
                  message: _registerResponse.body,
                  statusCode: _registerResponse.statusCode,
                ),
              );
          }
        });
  }
}
