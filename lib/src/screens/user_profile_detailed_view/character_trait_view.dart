import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:flutter/material.dart';

class CharacterTraitView extends StatelessWidget {
  final CharacterTrait characterTrait;
  const CharacterTraitView({
    super.key,
    required this.characterTrait,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              characterTrait.bottomName,
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              characterTrait.topName,
              style: const TextStyle(fontSize: 16.0),
            )
          ],
        ),
        Slider(
          value: characterTrait.degree,
          min: 0,
          max: 10,
          activeColor: Theme.of(context).colorScheme.onBackground,
          thumbColor: Theme.of(context).colorScheme.onBackground,
          inactiveColor: Theme.of(context).colorScheme.onBackground,
          onChanged: (double val) {},
        ),
      ],
    );
  }
}
