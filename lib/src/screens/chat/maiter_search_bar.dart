import 'package:flutter/material.dart';

class AmicaSearchBar extends StatelessWidget {
  const AmicaSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        bottom: 12,
      ),
      child: SizedBox(
        height: 32,
        child: TextField(
          autocorrect: true,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          cursorHeight: 12,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Theme.of(context).colorScheme.onSecondary,
            filled: true,
            fillColor: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
