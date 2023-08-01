import 'package:flutter/material.dart';

class AmicaButton extends StatefulWidget {
  final void Function()? onPressed;
  final String text;
  final double? minWidth;
  final double? height;
  final Color? color;
  final Color? textColor;
  final TextStyle? textStyle;

  const AmicaButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.textStyle,
    this.minWidth,
    this.height,
  });

  @override
  State<AmicaButton> createState() => _AmicaButtonState();
}

class _AmicaButtonState extends State<AmicaButton> {
  TextStyle get textStyle {
    if (widget.textStyle == null) {
      return const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
    } else {
      return widget.textStyle!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: widget.color ?? Theme.of(context).colorScheme.tertiary,
      textColor: widget.textColor ?? Theme.of(context).colorScheme.onError,
      minWidth: widget.minWidth ?? 145,
      height: widget.height,
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    );
  }
}
