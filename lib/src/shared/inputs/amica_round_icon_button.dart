import 'package:flutter/material.dart';

typedef ButtonCallback = void Function();

class AmicaRoundIconButton extends StatelessWidget {
  final ButtonCallback onTap;
  final Widget icon;
  Color? fillColor;
  EdgeInsetsGeometry? padding;

  AmicaRoundIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.fillColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: fillColor,
        padding: padding ?? const EdgeInsets.all(8.0),
      ),
      child: icon,
    );
  }
}
