import 'package:flutter/material.dart';

class MaiterSelect<T> extends StatefulWidget {
  final Iterable<T> options;
  final T initialValue;
  final String fieldName;

  const MaiterSelect({
    super.key,
    required this.options,
    required this.initialValue,
    required this.fieldName,
  });

  @override
  State<MaiterSelect> createState() => _MaiterSelectState<T>();
}

class _MaiterSelectState<T> extends State<MaiterSelect<T>> {
  T? _value;

  void _selectItem(value) {
    setState(() {
      _value = value ?? widget.initialValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          widget.fieldName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        DropdownButtonFormField<T>(
          dropdownColor: Theme.of(context).colorScheme.primary,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.primary,
          ),
          isExpanded: true,
          items: List.generate(
            widget.options.length,
            (index) => DropdownMenuItem(
              value: widget.options.elementAt(index),
              child: Text(
                widget.options.elementAt(index).toString(),
              ),
            ),
          ),
          value: _value ?? widget.initialValue,
          onChanged: _selectItem,
        ),
      ],
    );
  }
}
