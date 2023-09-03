import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_range.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventCreate extends StatefulWidget {
  const EventCreate({super.key});

  @override
  State<EventCreate> createState() => _EventCreateState();
}

class _EventCreateState extends State<EventCreate> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Align(
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 50,
          ),
          children: [
            const AmicaTextFormInput(
              fieldName: 'Event description',
              hintText: "i'd like to drink some coffe with ya",
              maxLines: 10,
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaSelect<String>(
              initialValue: lookingFors.values.last,
              options: lookingFors.values,
              fieldName: 'Looking for',
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            const AmicaRange(
              title: 'Range',
              max: 1000,
              min: 1,
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            const AmicaRange(
              title: 'Amount of people',
              max: 50000,
              min: 1,
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            const AmicaRange(
              title: 'Age Constraints',
              max: 90,
              min: 18,
            ),
            //TODO: location
          ],
        ),
      ),
    );
  }
}
