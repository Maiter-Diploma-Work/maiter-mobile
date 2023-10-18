import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/profile/profile.service.dart';
import 'package:amica/src/shared/character_traits/character_traits.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_checkbox.dart';
import 'package:amica/src/shared/inputs/amica_datepicker.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:amica/src/shared/inputs/expectations_list.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileEditView extends StatefulWidget {
  final UserProfile profile;
  final ProfileService profileService;

  const ProfileEditView({
    super.key,
    required this.profile,
    required this.profileService,
  });

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  late final FormGroup profileEditForm;

  Widget get _goals {
    final values = List.from(
      (profileEditForm.control('goals') as FormGroup).controls.entries.map(
        (e) {
          return AmicaCheckbox(
            label: e.key,
            onCheck: (isChecked) {},
            control: e.value as FormControl<bool>,
          );
        },
      ),
    );

    return Column(
      children: [
        const Text('Your goals'),
        ...values,
      ],
    );
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
            initialDate: profileEditForm.control('birthDate').value,
            fieldName: 'Birthdate',
            onUpdate: (newDate) {
              setState(() {
                profileEditForm.control('birthDate').value = newDate;
              });
            },
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: widget.profile.gender,
            options: genders.values,
            fieldName: 'Gender',
            onUpdate: (newValue) {
              setState(() {
                profileEditForm.control('gender').value = newValue;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _statusAndLookingForInputs(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: widget.profile.status,
            options: statuses.values,
            fieldName: 'Status',
            onUpdate: (newValue) {
              setState(() {
                profileEditForm.control('status').value = newValue;
              });
            },
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: widget.profile.lookingFor,
            options: lookingFors.values,
            fieldName: 'Looking for',
            onUpdate: (newValue) {
              setState(() {
                profileEditForm.control('lookingFor').value = newValue;
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    widget.profileService.setEditForm(widget.profile);
    profileEditForm = widget.profileService.profileEditForm;
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: profileEditForm,
      child: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 50),
          children: [
            const Gap.cubic(38),
            AmicaTextFormInput(
              fieldName: 'Name',
              hintText: 'Your Name',
              initialValue: widget.profile.name,
              controller: profileEditForm.control('name') as FormControl,
            ),
            const Gap.cubic(24),
            _birthDateAndGenderInputs(context),
            const Gap.cubic(24),
            _statusAndLookingForInputs(context),
            const Gap.cubic(24),
            AmicaTextFormInput(
              fieldName: 'Education',
              hintText: 'Hogwartz - Griffindor',
              // initialValue: widget.profile.education,
              controller: profileEditForm.control('education') as FormControl,
            ),
            const Gap.cubic(24),
            _goals,
            const Gap.cubic(24),
            AmicaTextFormInput(
              fieldName: 'About me',
              hintText: 'I love cats!..',
              maxLines: 10,
              // initialValue: widget.profile.description,
              controller:
                  profileEditForm.control('description') as FormControl<String>,
            ),
            const Gap.cubic(24),
            CharacterTraits(
              isEditable: true,
              controller: profileEditForm.control('characterTraits')
                  as FormArray<CharacterTrait>,
            ),
            ExpectationsList(
              expectations:
                  profileEditForm.control('expectations') as FormArray<String>,
            ),
          ],
        ),
      ),
    );
  }
}
