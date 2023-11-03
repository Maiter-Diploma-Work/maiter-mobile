import 'package:amica/src/services/auth/auth.service.dart';
import 'package:amica/src/stores/action.dart';

class FillPersonalInfoAction extends Action {
  // The service is used because it would be too much fields in one class that
  // represent an action supposed to simply send data to the backend
  final AuthService authService;

  FillPersonalInfoAction({
    required this.authService,
  });
}
