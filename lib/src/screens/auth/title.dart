import 'package:flutter/material.dart';

class AmicaTitle extends StatelessWidget {
  final String text;

  const AmicaTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
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
}
