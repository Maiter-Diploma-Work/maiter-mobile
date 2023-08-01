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
          gradient: LinearGradient(
            colors: [
              Color(0xFF303F9F),
              Color(0xFF3344B0),
              Color(0xFF7128E9),
              Color(0xFF7E18FF),
            ],
            transform: GradientRotation(1.5),
          ),
        ),
        child: widget.screenBody,
      ),
    );
  }
}
