import 'package:amica/src/layouts/registration_screen.dart';
import 'package:amica/src/screens/auth/login/login.dart';
import 'package:amica/src/screens/auth/register/steps/interest_step.dart';
import 'package:amica/src/screens/auth/register/steps/step_1.dart';
import 'package:amica/src/screens/auth/register/steps/step_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'register/register.dart';

final loginRouter = GoRoute(
  path: 'auth/login',
  builder: (context, state) => const LoginScreen(),
);
final registerRouter = GoRoute(
  path: 'auth/register',
  builder: (context, state) => const RegisterScreen(),
  routes: [
    GoRoute(
      path: 'step-1',
      builder: (context, state) => RegistrationScreen(
        title: 'Fill your profile',
        stepTitle: 'Step 1: Personal Info',
        body: const RegistrationFirstStep(),
        onBackTapped: () => context.go('/auth/register'),
        onForwardTapped: () => context.go('/auth/register/step-2'),
      ),
    ),
    GoRoute(
      path: 'step-2',
      builder: (context, state) => RegistrationScreen(
        title: 'Fill your profile',
        stepTitle: 'Step 2: Your goal',
        body: const RegistrationSecondStep(),
        onBackTapped: () => context.go('/auth/register/step-1'),
        onForwardTapped: () => context.go('/auth/register/step-3'),
      ),
    ),
    GoRoute(
      path: 'step-3',
      builder: (context, state) => RegistrationScreen(
        title: 'Fill your profile',
        stepTitle: 'Step 3: Interests',
        body: const RegistrationInterests(
          selectedInterests: [],
        ),
        onBackTapped: () => context.go('/auth/register/step-2'),
        onForwardTapped: () => context.go('/search/user'),
        // padding: const EdgeInsets.all(0),
      ),
    ),
  ],
);
