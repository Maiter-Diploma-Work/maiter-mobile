import 'package:amica/src/models/profiles/user_profile.dart';

class UserState {
  final UserProfile user;
  final String accessToken;
  final bool isLoading;

  UserState({
    required this.user,
    required this.accessToken,
    required this.isLoading,
  });
}
