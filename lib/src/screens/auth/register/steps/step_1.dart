import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/auth/auth.service.dart';
import 'package:amica/src/shared/character_traits/character_traits.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/inputs/amica_datepicker.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:amica/src/shared/maps/google_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegistrationFirstStep extends StatefulWidget {
  final AuthService authService;

  const RegistrationFirstStep({super.key, required this.authService});

  @override
  State<RegistrationFirstStep> createState() => _RegistrationFirstStepState();
}

class _RegistrationFirstStepState extends State<RegistrationFirstStep> {
  late final FormGroup formGroup;

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
              location: const LatLng(
                0,
                0,
              ),
              onUpdate: (LatLng location) => widget.authService.personalInfoForm
                  .control('location')
                  .value = location,
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    formGroup = widget.authService.personalInfoForm;
  }

  Widget _birthDateAndGenderInputs(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaDatepicker(
            initialDate: DateTime.now(),
            fieldName: 'Birthdate',
            onUpdate: (newDate) {
              print(newDate.toString());
              setState(() {
                formGroup.control('birthdate').value = newDate;
              });
            },
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: genders.values.first,
            options: genders.values,
            fieldName: 'Gender',
            onUpdate: (newValue) {
              setState(() {
                formGroup.control('gender').value = newValue;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _locationAndHeight(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.44,
          child: AmicaTextFormInput(
            initialValue: '0',
            textInputType: TextInputType.number,
            fieldName: 'height',
            hintText: '175',
            controller: formGroup.control('height') as FormControl<int>,
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaButton(
            text: 'Location',
            onPressed: () => _dialogBuilder(context),
            color: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
          ),
          // child: AmicaTextFormInput(
          //   initialValue: '',
          //   textInputType: TextInputType.streetAddress,
          //   fieldName: 'Location',
          //   hintText: 'In case you will disable geolocation',
          //   controller: formGroup.control('location') as FormControl<String>,
          // ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AmicaTextFormInput(
              fieldName: 'Name',
              hintText: 'Your Name',
              initialValue: '',
              controller: formGroup.control('name') as FormControl<String>,
            ),
            const Gap.cubic(24),
            _birthDateAndGenderInputs(context),
            const Gap.cubic(24),
            AmicaTextFormInput(
              fieldName: 'Education',
              hintText: 'Hogwartz - Griffindor',
              initialValue: '',
              controller: formGroup.control('education') as FormControl<String>,
            ),
            const Gap.cubic(24),
            _locationAndHeight(context),
            const Gap.cubic(24),
            AmicaTextFormInput(
              fieldName: 'About me',
              hintText: 'I love cats!..',
              maxLines: 10,
              initialValue: '',
              controller: formGroup.control('bio') as FormControl<String>,
            ),
            const Gap.cubic(24),
            CharacterTraits(
              isEditable: true,
              controller: formGroup.control('characterTraits')
                  as FormArray<CharacterTrait>,
            ),
          ],
        ),
      ),
    );
  }
}
