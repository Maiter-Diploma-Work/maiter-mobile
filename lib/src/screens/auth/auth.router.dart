import 'dart:convert';

import 'package:amica/src/layouts/registration_screen.dart';
import 'package:amica/src/screens/auth/login/login.dart';
import 'package:amica/src/screens/auth/register/steps/interest_step.dart';
import 'package:amica/src/screens/auth/register/steps/step_1.dart';
import 'package:amica/src/screens/auth/register/steps/step_2.dart';
import 'package:amica/src/services/api_url.dart';
import 'package:amica/src/services/auth/mock_auth.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

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
        body: RegistrationFirstStep(authService: MockAuthService.instance),
        onBackTapped: () => context.go('/auth/register'),
        onForwardTapped: () async {
          // LatLng location = MockAuthService.instance.personalInfoForm
          //     .control('location')
          //     .value as LatLng;
          // JsonEncoder encoder = const JsonEncoder.withIndent("    ");
          // Map<String, Object?> body = {
          //   ...MockAuthService.instance.personalInfoForm.value,
          //   'location': {
          //     'latitude': location.latitude,
          //     'longitude': location.longitude,
          //   },
          //   'birthdate': MockAuthService.instance.personalInfoForm
          //       .control('birthdate')
          //       .value
          //       .toString(),
          // };
          // debugPrint(encoder.convert(body));
          // var response = await http.post(
          //   Uri.parse('$apiUrl/api/auth/registerPersonalInfo'),
          //   headers: <String, String>{
          //     'Content-Type': 'application/json; charset=UTF-8',
          //   },
          //   body: jsonEncode(body),
          // );
          // debugPrint(response.body);

          context.go('/auth/register/step-2');
        },
      ),
    ),
    GoRoute(
      path: 'step-2',
      builder: (context, state) => RegistrationScreen(
        title: 'Fill your profile',
        stepTitle: 'Step 2: Your goal',
        body: RegistrationSecondStep(authService: MockAuthService.instance),
        onBackTapped: () => context.go('/auth/register/step-1'),
        onForwardTapped: () {
          // print(MockAuthService.instance.goalForm.value.toString());
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
          authService: MockAuthService.instance,
        ),
        onBackTapped: () => context.go('/auth/register/step-2'),
        onForwardTapped: () async {
          LatLng location = MockAuthService.instance.personalInfoForm
              .control('location')
              .value as LatLng;
          JsonEncoder encoder = const JsonEncoder.withIndent("    ");
          Map<String, Object?> body = {
            ...MockAuthService.instance.personalInfoForm.value,
            'location': [
              location.latitude,
              location.longitude,
            ],
            'birthdate': MockAuthService.instance.personalInfoForm
                .control('birthdate')
                .value
                .toString(),
            ...MockAuthService.instance.goalForm.value,
            'interests': List.from(
              MockAuthService.instance.selectedInterests.map((e) => e.name),
            ),
            'favoriteSong':
                MockAuthService.instance.favoriteSong.value.toString(),
          };
          debugPrint(encoder.convert(body));
          http.Response response = await http.post(
            Uri.parse('$apiUrl/api/auth/registerPersonalInfo'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(body),
          );

          debugPrint(response.body);

          context.go('/search');
        },
        // padding: const EdgeInsets.all(0),
      ),
    ),
  ],
);
