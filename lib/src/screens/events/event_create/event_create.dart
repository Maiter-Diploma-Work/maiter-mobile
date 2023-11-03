import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/event/event.service.dart';
import 'package:amica/src/services/profile/profile.service.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/inputs/amica_range.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:amica/src/shared/inputs/amica_slider.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:amica/src/shared/maps/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EventCreate extends StatefulWidget {
  final ProfileService profileService;
  final EventService eventService;

  const EventCreate({
    super.key,
    required this.profileService,
    required this.eventService,
  });

  @override
  State<EventCreate> createState() => _EventCreateState();
}

class _EventCreateState extends State<EventCreate> {
  late final FormGroup _form;

  Future<String?> _dialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          backgroundColor: Colors.transparent,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: AmicaGoogleMaps(
              location: LatLng(
                widget.profileService.userProfile!.location.latitude,
                widget.profileService.userProfile!.location.longitude,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _form = widget.eventService.createEventForm;
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
            AmicaTextFormInput(
              fieldName: 'Event description',
              hintText: "i'd like to drink some coffe with ya",
              maxLines: 10,
              controller: _form.control('description') as FormControl,
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaSelect<String>(
              initialValue: lookingFors.values.last,
              options: lookingFors.values,
              fieldName: 'Gender',
              onUpdate: (newValue) {
                setState(() {
                  _form.control('lookingFor').value = newValue;
                });
              },
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaSlider(
              title: 'Range',
              max: 1000,
              min: 1,
              control: _form.control('range') as FormControl,
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaSlider(
              title: 'Amount of people',
              max: 500,
              min: 1,
              control: _form.control('amountOfPeople') as FormControl,
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaRange(
              title: 'Age Constraints',
              max: 90,
              min: 18,
              control: _form.control('ageConstraints') as FormControl,
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaButton(
              onPressed: () => _dialogBuilder(context),
              text: 'Choose location',
              color: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
