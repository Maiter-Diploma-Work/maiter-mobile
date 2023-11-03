import 'package:amica/src/stores/action.dart';

class UserRegisterAction extends Action {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  UserRegisterAction({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

class UserRegisterSuccessAction extends Action {
  final int id;
  final String token;

  UserRegisterSuccessAction({required this.id, required this.token});
}

class UserRegisterFailureAction extends Action {
  final String message;
  final int statusCode;

  UserRegisterFailureAction({required this.message, required this.statusCode});
}
