import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../layouts/start_screen.dart';
import '../../shared/gap.dart';
import '../../shared/inputs/amica_button.dart';
import '../../shared/title.dart' as title;

class AuthMethodChoice extends StatelessWidget {
  const AuthMethodChoice({super.key});

  TextStyle titleTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.brightness == Brightness.light
          ? Colors.black
          : Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 32,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StartScreen(
      isWelcomeView: false,
      hasBackgroundImage: false,
      screenBody: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/logo/logo-red.png',
                width: 153,
                height: 153,
              ),
              const Gap(horizontalGap: 0, verticalGap: 32.0),
              title.AmicaTitle(
                text: "Sign in to continue",
                fontStyle: titleTextStyle(context),
              ),
              const Gap(horizontalGap: 0, verticalGap: 128.0),
              AmicaButton(
                onPressed: () => context.go('/auth/login'),
                text: "Log in",
                color: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.onPrimary,
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(horizontalGap: 0, verticalGap: 32.0),
              AmicaButton(
                onPressed: () => context.go('/auth/register'),
                text: "Sign up",
                color: Theme.of(context).colorScheme.onPrimary,
                textColor: Theme.of(context).colorScheme.primary,
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
