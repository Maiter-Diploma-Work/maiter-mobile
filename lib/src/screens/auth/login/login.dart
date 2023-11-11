import 'dart:convert';

import 'package:amica/src/layouts/start_screen.dart';
import 'package:amica/src/services/auth/auth.service.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:amica/src/shared/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreen extends StatelessWidget {
  final AuthService authService;

  const LoginScreen({super.key, required this.authService});

  void _onLoginClick(BuildContext context) async {
    http.Response response = await authService.login();
    if (response.statusCode != 200) return;

    if (jsonDecode(response.body)['isFilled'] == true) {
      context.go('/search');
    } else if (jsonDecode(response.body)['isFilled'] == false) {
      context.go('/auth/register/step-1');
    }
  }

  Widget formGenerator(BuildContext context) {
    return ReactiveForm(
      formGroup: authService.loginForm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AmicaTextFormInput(
            fieldName: "Email",
            hintText: "Enter your email",
            controller:
                authService.loginForm.control('email') as FormControl<String>,
          ),
          const Gap(horizontalGap: 0, verticalGap: 30.0),
          AmicaTextFormInput(
            fieldName: "Password",
            hintText: "Enter your password",
            controller: authService.loginForm.control('password')
                as FormControl<String>,
          ),
          const Gap(horizontalGap: 0, verticalGap: 132.0),
          AmicaButton(
            onPressed: () => _onLoginClick(context),
            text: "Login",
            color: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(horizontalGap: 0, verticalGap: 40.0),
          AmicaButton(
            onPressed: () => context.go('/auth/register'),
            text: "Register",
            color: Theme.of(context).colorScheme.onPrimary,
            textColor: Theme.of(context).colorScheme.primary,
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StartScreen(
      screenBody: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AmicaTitle(text: "Login"),
              const Gap(horizontalGap: 0, verticalGap: 64.0),
              formGenerator(context),
            ],
          ),
        ),
      ),
    );
  }
}
