import 'package:amica/src/services/auth/auth.service.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:amica/src/shared/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:reactive_forms/reactive_forms.dart';

import '../../../layouts/start_screen.dart';

class RegisterScreen extends StatelessWidget {
  final AuthService authService;

  const RegisterScreen({super.key, required this.authService});

  Future<void> _onRegisterClick(BuildContext context) async {
    http.Response response = await authService.register();

    if (response.statusCode == 200) {
      context.go('/auth/register/step-1');
    }
  }

  Widget formGenerator(BuildContext context) {
    return ReactiveForm(
      formGroup: authService.registerForm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AmicaTextFormInput(
            fieldName: "Email",
            hintText: "Enter your email",
            controller: authService.registerForm.control('email')
                as FormControl<String>,
          ),
          const Gap(horizontalGap: 0, verticalGap: 30),
          AmicaTextFormInput(
            fieldName: "Username",
            hintText:
                "Enter your username (will be displayed with @ at the start)",
            controller: authService.registerForm.control('username')
                as FormControl<String>,
          ),
          const Gap(horizontalGap: 0, verticalGap: 30),
          AmicaTextFormInput(
            fieldName: "Password",
            hintText: "Enter your password",
            controller: authService.registerForm.control('password')
                as FormControl<String>,
            isPassword: true,
          ),
          const Gap(horizontalGap: 0, verticalGap: 30),
          AmicaTextFormInput(
            fieldName: "Confirm Password",
            hintText: "Repeat your password",
            controller: authService.registerForm.control('confirmPassword')
                as FormControl<String>,
            isPassword: true,
          ),
          const Gap(horizontalGap: 0, verticalGap: 70),
          AmicaButton(
            onPressed: () => _onRegisterClick(context),
            text: "Register",
            color: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap.cubic(40),
          AmicaButton(
            onPressed: () => context.go('/auth/login'),
            text: "Login",
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
              const AmicaTitle(text: "Register"),
              const Gap.cubic(60.0),
              formGenerator(context),
            ],
          ),
        ),
      ),
    );
  }
}
