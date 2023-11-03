import 'package:flutter/material.dart';

class AmicaTitle extends StatelessWidget {
  final String text;
  final TextStyle? fontStyle;

  const AmicaTitle({
    super.key,
    required this.text,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: fontStyle ??
          const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 40.0,
          ),
      textAlign: TextAlign.center,
    );
  }
}
