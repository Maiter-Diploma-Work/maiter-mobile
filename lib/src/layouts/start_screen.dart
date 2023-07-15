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
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF7E18FF),
            Color(0xFFe95184),
          ], transform: GradientRotation(1.5)),
        ),
        child: widget.screenBody,
      ),
    );
  }
}
