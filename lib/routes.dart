import 'package:go_router/go_router.dart';
import 'package:maiter/user_profile_view/anna_shapovalova.dart';
import 'package:maiter/user_profile_view/user_profile_view.dart';
import 'package:maiter/welcome_view/welcome_view.dart';

import 'auth/login/login.dart';
import 'auth/register/register.dart';

final searchUser = GoRoute(
  path: '/user/:id',
  builder: (context, state) => UserProfileView(profile: AnnaShapovalova),
);
// final searchEvent = GoRoute(
//   path: '/event/:id',
//   builder: (context, state) => UserProfileView(profile: AnnaShapovalova),
// );
// final searchGroup = GoRoute(
//   path: '/group/:id',
//   builder: (context, state) => UserProfileView(profile: AnnaShapovalova),
// );

final search = GoRoute(
  path: '/search',
  routes: <GoRoute>[
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
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    searchUser,
    login,
    register,
  ],
);
