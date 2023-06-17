import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maiter/shared/maiter_button.dart';

import '../shared/gap.dart';
import '../shared/title.dart' as title;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //TODO: remove the magic strings
          const title.Title(text: "Welcome to"),
          const Gap(
            horizontalGap: 0,
            verticalGap: 20.0,
          ),
          const title.Title(text: "Maiter"),
          const Gap(
            horizontalGap: 0,
            verticalGap: 60.0,
          ),
          MaiterButton(
              onPressed: () => context.go('/auth/login'), text: "Login"),
          const Gap(
            horizontalGap: 0,
            verticalGap: 20.0,
          ),
          MaiterButton(
              onPressed: () => context.go('/auth/register'), text: "Register"),
        ],
      ),
    );
  }
}
