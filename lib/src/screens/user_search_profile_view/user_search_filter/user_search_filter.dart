import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/filters/filter_card.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:flutter/material.dart';

class UserSearchFilter extends StatelessWidget {
  final UserProfile profile;

  const UserSearchFilter({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Form(
        child: ListView(
          shrinkWrap: false,
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
              initialValue: profile.lookingFor,
              options: lookingFors.values,
              fieldName: 'Show me',
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            const AmicaFilterCard(
              title: 'Interests',
              valueTitle: '',
              enabledTitle: 'Show people only with these interests',
              max: 100,
              min: 18,
              typeOfInput: FilterInputs.interests,
            ),
          ],
        ),
      ),
    );
  }
}
