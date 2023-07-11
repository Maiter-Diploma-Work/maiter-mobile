import 'package:go_router/go_router.dart';
import 'package:maiter/src/data/anna_shapovalova.dart';
import 'package:maiter/src/layouts/scaffold.dart';
import 'package:maiter/src/screens/auth/login/login.dart';
import 'package:maiter/src/screens/auth/register/register.dart';
import 'package:maiter/src/screens/user_profile_view/user_profile_view.dart';
import 'package:maiter/src/screens/welcome_view/welcome_view.dart';

final searchUser = GoRoute(
  path: '/search/user',
  builder: (context, state) => MaiterScaffold(
    title: "User Search",
    scaffoldBody: UserProfileView(
      profile: AnnaShapovalova,
    ),
  ),
);

final search = GoRoute(
  path: '/search',
  routes: [
    searchUser,
    //searchEvent,
    //searchGroup
  ],
);

final login = GoRoute(
  path: '/auth/login',
  builder: (context, state) => const LoginScreen(),
);
final register = GoRoute(
  path: '/auth/register',
  builder: (context, state) => const RegisterScreen(),
);

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const WelcomeScreen()),
    searchUser,
    login,
    register,
  ],
);
