import 'package:amica/src/layouts/start_screen.dart';
import 'package:amica/src/screens/auth/title.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onLoginClick(BuildContext context) {
    context.go('/search/user');
  }

  Form formGenerator(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AmicaTextFormInput(
            fieldName: "Email",
            hintText: "Enter your email",
          ),
          const Gap(horizontalGap: 0, verticalGap: 30.0),
          const AmicaTextFormInput(
            fieldName: "Password",
            hintText: "Enter your password",
          ),
          const Gap(horizontalGap: 0, verticalGap: 132.0),
          AmicaButton(
            onPressed: () => context.go('/search/user'),
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
      screenBody: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AmicaTitle(text: "Login"),
              const Gap(horizontalGap: 0, verticalGap: 64.0),
              formGenerator(context)
            ],
          ),
        ],
      ),
    );
  }
}
