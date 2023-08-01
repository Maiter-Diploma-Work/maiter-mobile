import 'package:flutter/material.dart';

class AmicaSelect<T> extends StatefulWidget {
  final Iterable<T> options;
  final T initialValue;
  final String fieldName;

  const AmicaSelect({
    super.key,
    required this.options,
    required this.initialValue,
    required this.fieldName,
  });

  @override
  State<AmicaSelect> createState() => _AmicaSelectState<T>();
}

class _AmicaSelectState<T> extends State<AmicaSelect<T>> {
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
