import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef OnAdd = void Function();
typedef OnRemove = void Function(int id);

class Expectation extends StatelessWidget {
  final int idx;
  final OnRemove? onRemove;
  final OnAdd? onAdd;
  final FormControl control;

  const Expectation({
    super.key,
    required this.onRemove,
    required this.onAdd,
    required this.idx,
    required this.control,
  });

  Widget getRemoveButton(BuildContext context) {
    if (onRemove == null) {
      return Container();
    }

    return IconButton(
      onPressed: () => onRemove!(idx),
      icon: Icon(
        Icons.remove,
        color: Theme.of(context).colorScheme.inverseSurface,
      ),
    );
  }

  Widget getAddButton(BuildContext context) {
    if (onAdd == null) {
      return Container();
    }

    return IconButton(
      onPressed: onAdd!,
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
        AmicaTextFormInput.expanded(
          fieldName: '',
          hintText: 'What do you expect?',
          initialValue: control.value,
          controller: control,
        ),
        getRemoveButton(context),
        getAddButton(context),
      ],
    );
  }
}
