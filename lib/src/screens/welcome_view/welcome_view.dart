import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../layouts/start_screen.dart';
import '../../shared/gap.dart';
import '../../shared/inputs/amica_button.dart';
import '../auth/title.dart' as title;

class WelcomeScreen extends StatelessWidget {
  final TextStyle titleTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 50,
  );

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StartScreen(
      hasBackgroundImage: true,
      screenBody: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //TODO: remove the magic strings
          title.AmicaTitle(
            text: "Welcome",
            fontStyle: titleTextStyle,
          ),
          const Gap(horizontalGap: 0, verticalGap: 40.0),
          Image.asset(
            'assets/logo/logo.png',
            width: 153,
            height: 153,
          ),
          const Gap(horizontalGap: 0, verticalGap: 15.0),
          title.AmicaTitle(
            text: "Amica",
            fontStyle: titleTextStyle,
          ),
          const Gap(horizontalGap: 0, verticalGap: 60.0),
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
}
