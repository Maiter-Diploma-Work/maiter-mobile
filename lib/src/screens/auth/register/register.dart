import 'package:amica/src/screens/auth/title.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../layouts/start_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  void _onRegisterClick(BuildContext context) {
    context.go('/search/user');
  }

  Form formGenerator(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AmicaTextFormInput(
            fieldName: "Email",
            hintText: "Enter your email",
          ),
          const Gap(horizontalGap: 0, verticalGap: 30),
          const AmicaTextFormInput(
            fieldName: "Username",
            hintText:
                "Enter your username (will be displayed with @ at the start)",
          ),
          const Gap(horizontalGap: 0, verticalGap: 30),
          const AmicaTextFormInput(
            fieldName: "Password",
            hintText: "Enter your password",
          ),
          const Gap(horizontalGap: 0, verticalGap: 30),
          const AmicaTextFormInput(
            fieldName: "Password",
            hintText: "Repeat your password",
          ),
          const Gap(horizontalGap: 0, verticalGap: 70),
          AmicaButton(
            onPressed: () => context.go('/auth/login'),
            text: "log in",
            color: Theme.of(context).colorScheme.onPrimary,
            textColor: Theme.of(context).colorScheme.primary,
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap.cubic(40),
          AmicaButton(
            onPressed: () => _onRegisterClick(context),
            text: "register",
            color: Theme.of(context).colorScheme.onPrimary,
            textColor: Theme.of(context).colorScheme.primary,
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          )
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //TODO: remove the magic strings
              const AmicaTitle(text: "Register"),
              const Gap.cubic(60.0),
              formGenerator(context),
            ],
          ),
        ],
      ),
    );
  }
}
