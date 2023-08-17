import 'package:amica/src/models/profiles/expectancies.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:flutter/material.dart';

typedef OnRemove = void Function(int index);
typedef OnAdd = void Function();

class Expectation extends StatelessWidget {
  final Expectancy expectancy;
  final OnRemove? onRemove;
  final OnAdd? onAdd;
  const Expectation({
    super.key,
    required this.onRemove,
    required this.onAdd,
    required this.expectancy,
  });

  Widget getRemoveButton(BuildContext context) {
    if (onRemove == null) {
      return Container();
    }

    return IconButton(
      onPressed: () => onRemove!(expectancy.id),
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
          initialValue: expectancy.text,
        ),
        getRemoveButton(context),
        getAddButton(context),
      ],
    );
  }
}
