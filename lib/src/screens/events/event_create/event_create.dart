import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/models/shared/location.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/google_maps.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/inputs/amica_range.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventCreate extends StatefulWidget {
  final Location profileLocation;

  const EventCreate({super.key, required this.profileLocation});

  @override
  State<EventCreate> createState() => _EventCreateState();
}

class _EventCreateState extends State<EventCreate> {
  Future<String?> _dialogBuilder(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          backgroundColor: Colors.transparent,
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: AmicaGoogleMaps(
              location: widget.profileLocation,
            ),
          ),
        );
      },
    );
  }

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
              fieldName: 'Gender',
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
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaButton(
              onPressed: () => _dialogBuilder(context),
              text: 'Choose location',
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
