import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_checkbox.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:amica/src/shared/inputs/expectations_list.dart';
import 'package:flutter/material.dart';

class RegistrationSecondStep extends StatefulWidget {
  const RegistrationSecondStep({super.key});

  @override
  State<RegistrationSecondStep> createState() => _RegistrationSecondStepState();
}

class _RegistrationSecondStepState extends State<RegistrationSecondStep> {
  final List<Widget> _amicaCheckbox = [
    AmicaCheckbox(
      label: 'Friends',
      onCheck: (bool isChecked) {},
    ),
    const Gap.cubic(12),
    AmicaCheckbox(
      label: 'Love',
      onCheck: (bool isChecked) {},
    ),
    const Gap.cubic(12),
    AmicaCheckbox(
      label: 'Adventures!',
      onCheck: (bool isChecked) {},
    )
  ];

  Widget _statusAndLookingForInputs(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: statuses.values.first,
            options: statuses.values,
            fieldName: 'Status',
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: lookingFors.values.last,
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
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Your goals'),
                ...List.from(
                  _amicaCheckbox.map(
                    (e) => ClipRect(
                      child: e,
                    ),
                  ),
                ),
              ],
            ),
            const Gap.cubic(24),
            _statusAndLookingForInputs(context),
            const Gap.cubic(24),
            ExpectationsList(
              profile: UserProfile.empty(),
            ),
          ],
        ),
      ),
    );
  }
}
