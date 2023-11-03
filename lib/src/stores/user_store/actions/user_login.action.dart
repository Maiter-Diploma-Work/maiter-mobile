import 'package:amica/src/stores/action.dart';

class UserLoginAction extends Action {
  final String email;
  final String password;

  UserLoginAction({
    required this.email,
    required this.password,
  });
}

class UserLoginSuccessAction extends Action {
  final int id;
  final String token;

  UserLoginSuccessAction({required this.id, required this.token});
}

class UserLoginFailureAction extends Action {
  final String message;
  final int statusCode;

  UserLoginFailureAction({required this.message, required this.statusCode});
}
