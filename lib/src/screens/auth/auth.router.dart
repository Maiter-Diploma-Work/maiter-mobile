import 'package:amica/src/layouts/registration_screen.dart';
import 'package:amica/src/screens/auth/login/login.dart';
import 'package:amica/src/screens/auth/register/steps/interest_step.dart';
import 'package:amica/src/screens/auth/register/steps/step_1.dart';
import 'package:amica/src/screens/auth/register/steps/step_2.dart';
import 'package:amica/src/screens/welcome_view/auth_method_choise.dart';
import 'package:amica/src/services/profile/mock_profile.service.dart';
import 'package:amica/src/services/service_factory.service.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'register/register.dart';

final authRouter = GoRoute(
    path: '/auth',
    builder: (context, state) => const AuthMethodChoice(),
    routes: [
      loginRouter,
      registerRouter,
    ]);

final loginRouter = GoRoute(
  path: 'login',
  builder: (context, state) => LoginScreen(
    authService: ServiceFactory.provideAuthService(),
  ),
);
final registerRouter = GoRoute(
  path: 'register',
  builder: (context, state) => RegisterScreen(
    authService: ServiceFactory.provideAuthService(),
  ),
  routes: [
    GoRoute(
      path: 'step-1',
      builder: (context, state) => RegistrationScreen(
        title: 'Fill your profile',
        stepTitle: 'Step 1: Personal Info',
        body: RegistrationFirstStep(
          authService: ServiceFactory.provideAuthService(),
        ),
        onBackTapped: () => context.go('/auth/register'),
        onForwardTapped: () => context.go('/auth/register/step-2'),
      ),
    ),
    GoRoute(
      path: 'step-2',
      builder: (context, state) => RegistrationScreen(
        title: 'Fill your profile',
        stepTitle: 'Step 2: Your goal',
        body: RegistrationSecondStep(
          authService: ServiceFactory.provideAuthService(),
        ),
        onBackTapped: () => context.go('/auth/register/step-1'),
        onForwardTapped: () {
          context.go('/auth/register/step-3');
        },
      ),
    ),
    GoRoute(
      path: 'step-3',
      builder: (context, state) => RegistrationScreen(
        title: 'Fill your profile',
        stepTitle: 'Step 3: Interests',
        body: RegistrationInterests(
          profileService: MockProfileService.instance,
        ),
        onBackTapped: () => context.go('/auth/register/step-2'),
        onForwardTapped: () async {
          http.Response response =
              await ServiceFactory.provideAuthService().fillInfo();
          if (response.statusCode == 200) {
            context.go('/search');
          }
        },
        // padding: const EdgeInsets.all(0),
      ),
    ),
  ],
);
