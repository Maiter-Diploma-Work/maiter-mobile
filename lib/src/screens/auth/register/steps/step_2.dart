import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/auth/register.service.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_checkbox.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:amica/src/shared/inputs/expectations_list.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegistrationSecondStep extends StatefulWidget {
  final RegisterService authService;

  const RegistrationSecondStep({super.key, required this.authService});

  @override
  State<RegistrationSecondStep> createState() => _RegistrationSecondStepState();
}

class _RegistrationSecondStepState extends State<RegistrationSecondStep> {
  late final FormGroup formGroup;

  @override
  void initState() {
    super.initState();
    formGroup = widget.authService.goalForm;
  }

  Widget get _goals {
    final values = List.from(
      (formGroup.control('goals') as FormGroup).controls.entries.map(
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
            onUpdate: (newValue) {
              setState(() {
                formGroup.control('status').value = newValue;
              });
            },
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width - 64) * 0.44,
          child: AmicaSelect<String>(
            initialValue: lookingFors.values.last,
            options: lookingFors.values,
            fieldName: 'Looking for',
            onUpdate: (newValue) {
              setState(() {
                formGroup.control('lookingFor').value = newValue;
              });
            },
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
            _goals,
            const Gap.cubic(24),
            _statusAndLookingForInputs(context),
            const Gap.cubic(24),
            ExpectationsList(
              expectations:
                  formGroup.control('expectations') as FormArray<String>,
            ),
          ],
        ),
      ),
    );
  }
}
