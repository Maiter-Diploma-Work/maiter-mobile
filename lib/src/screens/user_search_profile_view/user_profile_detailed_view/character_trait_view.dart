import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CharacterTraitView extends StatefulWidget {
  final bool isEditable;
  final FormControl<CharacterTrait> traitControl;

  const CharacterTraitView({
    super.key,
    required this.isEditable,
    required this.traitControl,
  });

  @override
  State<CharacterTraitView> createState() => _CharacterTraitViewState();
}

class _CharacterTraitViewState extends State<CharacterTraitView> {
  @override
  Widget build(BuildContext context) {
    CharacterTrait trait = widget.traitControl.value!;
    Color color = Theme.of(context).colorScheme.onBackground;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              trait.bottomName,
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              trait.topName,
              style: const TextStyle(fontSize: 16.0),
            )
          ],
        ),
        Slider(
          value: trait.degree.toDouble(),
          min: 0,
          max: 10,
          activeColor: color,
          thumbColor: color,
          inactiveColor: color,
          onChanged: (double val) {
            setState(() {
              if (widget.isEditable) {
                widget.traitControl.value = CharacterTrait(
                  id: trait.id,
                  userId: trait.userId,
                  bottomName: trait.bottomName,
                  topName: trait.topName,
                  degree: val.toInt(),
                );
              }
            });
          },
        ),
      ],
    );
  }
}
