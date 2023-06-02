import 'package:flutter/material.dart';

class MaiterButton extends StatefulWidget {
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;

  const MaiterButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.color,
      this.textColor});

  @override
  State<StatefulWidget> createState() => _MaiterButtonState();
}

class _MaiterButtonState extends State<MaiterButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              widget.color ?? Theme.of(context).colorScheme.error),
          foregroundColor: MaterialStateProperty.all(
              widget.textColor ?? Theme.of(context).colorScheme.onError),
          minimumSize: MaterialStateProperty.all(const Size(185, 38))),
      child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
