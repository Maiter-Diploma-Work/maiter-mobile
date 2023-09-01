import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/filters/filter_card.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:flutter/material.dart';

class EventSearchFilter extends StatelessWidget {
  final String lookingFor;

  const EventSearchFilter({super.key, required this.lookingFor});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Align(
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          shrinkWrap: true,
          children: [
            const AmicaFilterCard(
              title: 'Distance',
              valueTitle: 'up to',
              enabledTitle: 'Show people only in this range',
              max: 100,
              min: 1,
              typeOfInput: FilterInputs.slider,
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            const AmicaFilterCard(
              title: 'Age',
              valueTitle: '',
              enabledTitle: 'Show people only within this range',
              max: 100,
              min: 18,
              typeOfInput: FilterInputs.range,
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaSelect<String>(
              initialValue: lookingFor,
              options: lookingFors.values,
              fieldName: 'Show me events created by',
            ),
          ],
        ),
      ),
    );
  }
}
