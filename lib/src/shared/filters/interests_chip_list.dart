import 'package:amica/src/models/shared/interest.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/inputs/amica_round_icon_button.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:amica/src/shared/interest_view.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef OnUpdate = void Function(List<Interest> interests);

class InterestsChipList extends StatefulWidget {
  final OnUpdate onUpdate;
  final List<Interest> interests;
  final FormControl newItemController;

  const InterestsChipList({
    super.key,
    required this.onUpdate,
    required this.interests,
    required this.newItemController,
  });

  @override
  State<InterestsChipList> createState() => _InterestsChipListState();
}

class _InterestsChipListState extends State<InterestsChipList> {
  Widget listItemGenerator(Interest interest) {
    List<Interest> newInterests = widget.interests
        .where((element) => element.name != interest.name)
        .toList();

    return InterestView(
      interest: interest,
      onTap: (element) => widget.onUpdate(newInterests),
    );
  }

  Future<String?> _dialogBuilder(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(21),
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width - 64,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AmicaTextFormInput(
                  fieldName: 'Your next interest',
                  hintText: 'sport?',
                  controller: widget.newItemController,
                ),
                const Gap(verticalGap: 16, horizontalGap: 0),
                AmicaButton(
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    widget.onUpdate(
                      [
                        ...widget.interests,
                        Interest(
                          id: widget.interests.lastIndexWhere((element) =>
                                  element.id >= widget.interests.length) +
                              1,
                          profileId: 1,
                          category: '',
                          name: widget.newItemController.value.toString(),
                        ),
                      ],
                    );
                    Navigator.of(context).pop(
                      widget.newItemController.value.toString(),
                    );
                  },
                  text: 'Confirm',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.newItemController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ...List.from(
          widget.interests.map(
            (Interest e) => listItemGenerator(e),
          ),
        ),
        AmicaRoundIconButton(
          onTap: () => _dialogBuilder(context),
          icon: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
            weight: 900,
          ),
          fillColor: Colors.white,
        ),
      ],
    );
  }
}
