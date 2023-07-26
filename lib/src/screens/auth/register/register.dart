import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maiter/src/shared/gap.dart';
import 'package:maiter/src/shared/inputs/maiter_button.dart';
import 'package:maiter/src/shared/inputs/maiter_text_form_input.dart';
import 'package:maiter/src/screens/auth/title.dart';

import '../../../layouts/start_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  void _onRegisterClick(BuildContext context) {
    context.go('/search/user');
  }

  Form formGenerator(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const MaiterTextFormInput(
            fieldName: "Email",
            hintText: "Enter your email",
            padding: EdgeInsets.only(left: 60, right: 60, bottom: 15, top: 0),
          ),
          const MaiterTextFormInput(
            fieldName: "Username",
            hintText:
                "Enter your username (will be displayed with @ at the start)",
            padding: EdgeInsets.only(left: 60, right: 60, bottom: 15, top: 0),
          ),
          const MaiterTextFormInput(
            fieldName: "Password",
            hintText: "Enter your password",
            padding: EdgeInsets.only(left: 60, right: 60, bottom: 15, top: 0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaiterButton(
                  onPressed: () => context.go('/auth/login'), text: "log in"),
              const Gap.cubic(15),
              MaiterButton(
                  onPressed: () => _onRegisterClick(context), text: "register"),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StartScreen(
      screenBody: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //TODO: remove the magic strings
          const MaiterTitle(text: "Welcome to"),
          const Gap.cubic(20.0),
          const MaiterTitle(text: "Maiter"),
          const Gap.cubic(60.0),
          formGenerator(context),
        ],
      ),
    );
  }
}
