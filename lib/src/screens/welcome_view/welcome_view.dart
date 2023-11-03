import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../layouts/start_screen.dart';
import '../../shared/gap.dart';
import '../../shared/inputs/amica_button.dart';
import '../../shared/title.dart' as title;

class WelcomeScreen extends StatelessWidget {
  final TextStyle titleTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 32,
  );

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StartScreen(
      hasBackgroundImage: true,
      isWelcomeView: true,
      screenBody: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                onPressed: () => context.go('/auth'),
                text: "Let's get started",
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
