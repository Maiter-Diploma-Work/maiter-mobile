import 'package:amica/src/layouts/start_screen.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:amica/src/shared/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginForm = FormGroup({
    'email': FormControl<String>(
      value: '',
      validators: [Validators.email, Validators.required],
    ),
    'password': FormControl<String>(
      value: '',
      validators: [Validators.required],
    ),
  });

  void _onLoginClick(BuildContext context) {
    context.go('/search');
  }

  Widget formGenerator(BuildContext context) {
    return ReactiveForm(
      formGroup: _loginForm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AmicaTextFormInput(
            fieldName: "Email",
            hintText: "Enter your email",
            controller: _loginForm.control('email') as FormControl<String>,
          ),
          const Gap(horizontalGap: 0, verticalGap: 30.0),
          AmicaTextFormInput(
            fieldName: "Password",
            hintText: "Enter your password",
            controller: _loginForm.control('password') as FormControl<String>,
          ),
          const Gap(horizontalGap: 0, verticalGap: 132.0),
          AmicaButton(
            onPressed: () => _onLoginClick(context),
            text: "Login",
            color: Theme.of(context).colorScheme.onPrimary,
            textColor: Theme.of(context).colorScheme.primary,
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
