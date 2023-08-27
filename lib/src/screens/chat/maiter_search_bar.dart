import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnChanged = void Function(String vlaue);

class AmicaSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final OnChanged? onChanged;

  const AmicaSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  State<AmicaSearchBar> createState() => _AmicaSearchBarState();
}

class _AmicaSearchBarState extends State<AmicaSearchBar> {
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
        child: TextFormField(
          controller: widget.controller,
          onChanged: widget.onChanged,
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
