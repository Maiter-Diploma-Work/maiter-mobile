import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  final Widget screenBody;

  const StartScreen({Key? key, required this.screenBody}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.error
            // const Color(0xFF7C18FF)
          ], transform: const GradientRotation(1.5)),
        ),
        child: widget.screenBody,
      ),
    );
  }
}
