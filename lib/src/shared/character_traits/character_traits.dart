import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:amica/src/screens/user_search_profile_view/user_profile_detailed_view/character_trait_view.dart';
import 'package:amica/src/shared/title.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CharacterTraits extends StatefulWidget {
  final bool isEditable;
  final FormArray<CharacterTrait> controller;

  const CharacterTraits({
    super.key,
    required this.isEditable,
    required this.controller,
  });

  @override
  State<CharacterTraits> createState() => _CharacterTraitsState();
}

class _CharacterTraitsState extends State<CharacterTraits> {
  @override
  Widget build(BuildContext context) {
    if (widget.controller.controls.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AmicaTitle(text: 'Character'),
        ...List.generate(
          widget.controller.controls.length,
          (int index) => CharacterTraitView(
            isEditable: widget.isEditable,
            traitControl: widget.controller.controls.elementAt(index)
                as FormControl<CharacterTrait>,
          ),
        ),
      ],
    );
  }
}
