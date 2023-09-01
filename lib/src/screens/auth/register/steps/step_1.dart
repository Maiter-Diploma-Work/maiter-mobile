import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/character_traits/character_traits.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_datepicker.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:flutter/material.dart';

class RegistrationFirstStep extends StatefulWidget {
  const RegistrationFirstStep({super.key});

  @override
  State<RegistrationFirstStep> createState() => _RegistrationFirstStepState();
}

class _RegistrationFirstStepState extends State<RegistrationFirstStep> {
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
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: genders.values.first,
            options: genders.values,
            fieldName: 'Gender',
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
          child: const AmicaTextFormInput(
            initialValue: '0',
            textInputType: TextInputType.number,
            fieldName: 'height',
            hintText: '175',
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: const AmicaTextFormInput(
            initialValue: '',
            textInputType: TextInputType.streetAddress,
            fieldName: 'Location',
            hintText: '',
          ),
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
            const AmicaTextFormInput(
              fieldName: 'Name',
              hintText: 'Your Name',
              initialValue: '',
            ),
            const Gap.cubic(24),
            _birthDateAndGenderInputs(context),
            const Gap.cubic(24),
            const AmicaTextFormInput(
              fieldName: 'Education',
              hintText: 'Hogwartz - Griffindor',
              initialValue: '',
            ),
            const Gap.cubic(24),
            _locationAndHeight(context),
            const Gap.cubic(24),
            const AmicaTextFormInput(
              fieldName: 'About me',
              hintText: 'I love cats!..',
              maxLines: 10,
              initialValue: '',
            ),
            const Gap.cubic(24),
            CharacterTraits(
              characterTraits: UserProfile.empty().characterTraits,
              isEditable: true,
            ),
          ],
        ),
      ),
    );
  }
}
