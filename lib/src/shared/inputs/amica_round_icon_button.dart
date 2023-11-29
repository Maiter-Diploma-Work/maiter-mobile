import 'package:flutter/material.dart';

typedef ButtonCallback = void Function();

class AmicaRoundIconButton extends StatelessWidget {
  final ButtonCallback onTap;
  final Widget icon;
  final Color? fillColor;
  final EdgeInsetsGeometry? padding;
  final String? label;
  final TextStyle? labelStyle;
  final List<BoxShadow>? shadows;

  const AmicaRoundIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.fillColor,
    this.padding,
    this.shadows,
  })  : label = null,
        labelStyle = null,
        super(key: key);

  const AmicaRoundIconButton.labeled(
    this.label, {
    Key? key,
    required this.onTap,
    required this.icon,
    this.fillColor,
    this.padding,
    this.labelStyle,
    this.shadows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget button = DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: shadows,
        shape: BoxShape.circle,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).colorScheme.primary,
          alignment: Alignment.center,
          padding: padding ?? const EdgeInsets.all(0.0),
        ),
        child: icon,
      ),
    );

    if (label == null) {
      return button;
    }

    return Column(
      children: [
        button,
        Text(
          label!,
          style: labelStyle,
        )
      ],
    );
  }
}
