import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:amica/src/screens/user_search_profile_view/user_profile_detailed_view/character_trait_view.dart';
import 'package:amica/src/shared/title.dart';
import 'package:flutter/material.dart';

class CharacterTraits extends StatefulWidget {
  final List<CharacterTrait> characterTraits;
  final bool isEditable;

  const CharacterTraits({
    super.key,
    required this.characterTraits,
    required this.isEditable,
  });

  @override
  State<CharacterTraits> createState() => _CharacterTraitsState();
}

class _CharacterTraitsState extends State<CharacterTraits> {
  @override
  Widget build(BuildContext context) {
    if (widget.characterTraits.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AmicaTitle(text: 'Character'),
        ...List.from(
          widget.characterTraits.map(
            (e) => CharacterTraitView(
              characterTrait: e,
              isEditable: widget.isEditable,
            ),
          ),
        ),
      ],
    );
  }
}
