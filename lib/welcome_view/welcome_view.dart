import 'package:flutter/material.dart';
import 'package:maiter/shared/maiter_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  Widget titleGenerator(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 40.0,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget gapGenerator(double gapSize) {
    return SizedBox(
      height: gapSize,
      width: gapSize,
    );
  }

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
          titleGenerator("Welcome to"),
          gapGenerator(20.0),
          titleGenerator("Maiter"),
          gapGenerator(60.0),
          MaiterButton(onPressed: () => {}, text: "Login"),
          gapGenerator(20.0),
          MaiterButton(onPressed: () => {}, text: "Register"),
        ],
      ),
    );
  }
}
