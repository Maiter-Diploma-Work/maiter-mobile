import 'package:flutter/material.dart';

class AmicaCard extends StatelessWidget {
  final Widget child;
  const AmicaCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 25,
        ),
        child: child,
      ),
    );
  }
}
