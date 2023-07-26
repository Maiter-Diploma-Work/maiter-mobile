import 'package:flutter/material.dart';

import '../gap.dart';

class SettingsButton extends StatelessWidget {
  final String text;
  final IconData icon;
  VoidCallback? onClick;

  SettingsButton({
    super.key,
    required this.text,
    required this.icon,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 12.0,
            offset: Offset(3, 6),
          ),
        ],
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      child: Row(
        children: [
          Icon(icon),
          const Gap(verticalGap: 0, horizontalGap: 16),
          FittedBox(
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
