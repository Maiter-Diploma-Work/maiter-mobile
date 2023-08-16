import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:flutter/material.dart';

typedef OnRemove = void Function(int index);
typedef OnAdd = void Function();

class Expectation extends StatefulWidget {
  final int index;
  final OnRemove? onRemove;
  final OnAdd? onAdd;
  const Expectation({
    super.key,
    required this.index,
    required this.onRemove,
    required this.onAdd,
  });

  @override
  State<Expectation> createState() => _ExpectationState();
}

class _ExpectationState extends State<Expectation> {
  Widget get removeButton {
    if (widget.onRemove == null) {
      return Container();
    }

    return IconButton(
      onPressed: () => widget.onRemove!(widget.index),
      icon: Icon(
        Icons.remove,
        color: Theme.of(context).colorScheme.inverseSurface,
      ),
    );
  }

  Widget get addButton {
    if (widget.onAdd == null) {
      return Container();
    }

    return IconButton(
      onPressed: widget.onAdd!,
      icon: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.inverseSurface,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AmicaTextFormInput.expanded(
          fieldName: '',
          hintText: 'What do you expect?',
        ),
        removeButton,
        addButton,
      ],
    );
  }
}
