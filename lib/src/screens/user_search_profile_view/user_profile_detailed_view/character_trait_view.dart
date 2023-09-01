import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:flutter/material.dart';

class CharacterTraitView extends StatefulWidget {
  final CharacterTrait characterTrait;
  final bool isEditable;

  const CharacterTraitView({
    super.key,
    required this.characterTrait,
    required this.isEditable,
  });

  @override
  State<CharacterTraitView> createState() => _CharacterTraitViewState();
}

class _CharacterTraitViewState extends State<CharacterTraitView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.characterTrait.bottomName,
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              widget.characterTrait.topName,
              style: const TextStyle(fontSize: 16.0),
            )
          ],
        ),
        Slider(
          value: widget.characterTrait.degree.toDouble(),
        min: 0,
          max: 10,
          activeColor: Theme.of(context).colorScheme.onBackground,
          thumbColor: Theme.of(context).colorScheme.onBackground,
          inactiveColor: Theme.of(context).colorScheme.onBackground,
          onChanged: (double val) {
            if (widget.isEditable) {
              setState(() {
                widget.characterTrait.degree = val.toInt();
              });
            }
          },
        ),
      ],
    );
  }
}
