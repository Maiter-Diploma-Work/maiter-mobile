import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/screens/auth/title.dart';
import 'package:amica/src/screens/profile_view/profile_edit_view/expectation.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_checkbox.dart';
import 'package:amica/src/shared/inputs/amica_datepicker.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:flutter/material.dart';

class ProfileEditView extends StatefulWidget {
  final UserProfile profile;

  const ProfileEditView({super.key, required this.profile});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  late List<Widget> _expectations = [];

  void addExpectation() {
    final int newIndex = _expectations.length;
    setState(() {
      _expectations = [
        ..._expectations,
        Expectation(
          index: newIndex,
          onRemove: (index) => removeExpectations(index),
          onAdd: addExpectation,
        ),
      ];
    });
  }

  void removeExpectations(int expectationId) {
    setState(() {
      _expectations = _expectations
          .where((element) => (element as Expectation).index != expectationId)
          .toList();
    });
    // _expectations.removeAt(expectationId);
  }

  Widget get expectations {
    if (_expectations.isEmpty) {
      return Column(
        children: [
          const Text('Add your expectations!'),
          IconButton(
            onPressed: addExpectation,
            icon: const Icon(Icons.add),
          ),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Expectations'),
        const Gap(verticalGap: 16, horizontalGap: 0),
        ...List.from(
          _expectations.map(
            (e) => Column(
              children: [
                e,
                const Gap(verticalGap: 16, horizontalGap: 0),
              ],
            ),
          ),
        ),
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
            initialDate: widget.profile.birthDate,
            fieldName: 'Birthdate',
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: widget.profile.gender,
            options: genders.values,
            fieldName: 'Gender',
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
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: widget.profile.lookingFor,
            options: lookingFors.values,
            fieldName: 'Looking for',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 50),
          children: [
            const Gap.cubic(38),
            AmicaTextFormInput(
              fieldName: 'Name',
              hintText: 'Your Name',
              initialValue: widget.profile.name,
            ),
            const Gap.cubic(24),
            _birthDateAndGenderInputs(context),
            const Gap.cubic(24),
            _statusAndLookingForInputs(context),
            const Gap.cubic(24),
            AmicaTextFormInput(
              fieldName: 'Education',
              hintText: 'Hogwartz - Griffindor',
              initialValue: widget.profile.education,
            ),
            const Gap.cubic(24),
            AmicaCheckbox(
              label: 'Friends',
              onCheck: (bool isChecked) {},
            ),
            const Gap.cubic(24),
            AmicaCheckbox(
              label: 'Love',
              onCheck: (bool isChecked) {},
            ),
            const Gap.cubic(24),
            AmicaCheckbox(
              label: 'Adventures!',
              onCheck: (bool isChecked) {},
            ),
            const Gap.cubic(24),
            AmicaTextFormInput(
              fieldName: 'About me',
              hintText: 'I love cats!..',
              maxLines: 10,
              initialValue: widget.profile.description,
            ),
            const Gap.cubic(24),
            expectations,
          ],
        ),
      ),
    );
  }
}
