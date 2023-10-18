import 'package:amica/src/models/filters/age_range.dart';
import 'package:amica/src/models/filters/user_filter.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/user/user_search.service.dart';
import 'package:amica/src/shared/filters/filter_card.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class UserSearchFilter extends StatefulWidget {
  final UserProfile profile;
  final UserSearchService searchService;

  const UserSearchFilter({
    super.key,
    required this.profile,
    required this.searchService,
  });

  @override
  State<UserSearchFilter> createState() => _UserSearchFilterState();
}

class _UserSearchFilterState extends State<UserSearchFilter> {
  late FormGroup _filterForm;

  Future<void> initializeFilters(UserProfile profile) async {
    await widget.searchService.initializeFilters(profile);
    setState(() {
      _filterForm = widget.searchService.userSearchFilterForm;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeFilters(widget.profile);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: Align(
        alignment: Alignment.center,
        child: ListView(
          children: [
            AmicaFilterCard(
              title: 'Distance',
              valueTitle: 'up to',
              enabledTitle: 'Show people only in this range',
              max: 100,
              min: 1,
              typeOfInput: FilterInputs.slider,
              control: _filterForm.control('distance') as FormControl<double>,
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaFilterCard(
              title: 'Age',
              valueTitle: '',
              enabledTitle: 'Show people only within this range',
              max: 100,
              min: 18,
              typeOfInput: FilterInputs.range,
              control: _filterForm.control(
                'age',
              ) as FormControl<AgeRange>,
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaSelect<String>(
              initialValue: _filterForm.control('lookingFor').value.toString(),
              options: lookingFors.values,
              fieldName: 'Show me',
              onUpdate: (newValue) {
                _filterForm.control('lookingFor').value = newValue;
              },
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaFilterCard(
              title: 'Interests',
              valueTitle: '',
              enabledTitle: 'Show people only with these interests',
              max: 100,
              min: 18,
              typeOfInput: FilterInputs.interests,
              control: _filterForm.control(
                'interests',
              ) as FormControl<List<String>>,
            ),
          ],
        ),
      ),
    );
  }
}
