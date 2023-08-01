import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../layouts/start_screen.dart';
import '../../shared/gap.dart';
import '../../shared/inputs/amica_button.dart';
import '../auth/title.dart' as title;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StartScreen(
      screenBody: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //TODO: remove the magic strings
          const title.AmicaTitle(text: "Welcome to"),
          const Gap(
            horizontalGap: 0,
            verticalGap: 20.0,
          ),
          const title.AmicaTitle(text: "Amica"),
          const Gap(horizontalGap: 0, verticalGap: 60.0),
          AmicaButton(
              onPressed: () => context.go('/auth/login'), text: "Login"),
          const Gap(horizontalGap: 0, verticalGap: 20.0),
          AmicaButton(
              onPressed: () => context.go('/auth/register'), text: "Register"),
        ],
      ),
    );
  }
}
