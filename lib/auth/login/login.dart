import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/gap.dart';
import '../../shared/maiter_text_form_input.dart';
import '../../shared/title.dart' as title;
import '../../shared/maiter_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            fieldName: "Password",
            hintText: "Enter your password",
            padding: EdgeInsets.only(left: 60, right: 60, bottom: 15, top: 0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaiterButton(onPressed: () => {}, text: "log in"),
              const Gap.cubic(15),
              MaiterButton(
                  onPressed: () => context.go('/auth/register'),
                  text: "register"),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODO: remove the magic strings
            const title.Title(text: "Welcome to"),
            const Gap.cubic(20.0),
            const title.Title(text: "Maiter"),
            const Gap.cubic(60.0),
            formGenerator(context),
          ],
        ),
      ),
    );
  }
}
