import 'package:amica/src/screens/auth/auth.router.dart';
import 'package:amica/src/screens/chat/chat.router.dart';
import 'package:amica/src/screens/events/events.router.dart';
import 'package:amica/src/screens/profile_view/profile.router.dart';
import 'package:amica/src/screens/user_search_profile_view/user_search.router.dart';
import 'package:amica/src/screens/welcome_view/welcome_view.dart';
import 'package:go_router/go_router.dart';

//TODO: State management?

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
      routes: [
        loginRouter,
        registerRouter,
      ],
    ),
    ...chatRouter,
    eventsRouter,
    searchUserRouter,
    profileRouter,
  ],
);
