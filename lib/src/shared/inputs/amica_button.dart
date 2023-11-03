import 'package:flutter/material.dart';

class AmicaButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double? minWidth;
  final double? height;
  final Color? color;
  final Color? textColor;
  final TextStyle? textStyle;
  final Size? maximumSize;

  const AmicaButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.textStyle,
    this.minWidth,
    this.height,
    this.maximumSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).colorScheme.tertiary,
        foregroundColor: textColor ?? Theme.of(context).colorScheme.onError,
        minimumSize: Size(minWidth ?? 145, height ?? 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        maximumSize: maximumSize,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle ??
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
