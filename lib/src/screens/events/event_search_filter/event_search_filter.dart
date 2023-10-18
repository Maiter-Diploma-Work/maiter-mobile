import 'package:amica/src/models/filters/age_range.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/event/event.service.dart';
import 'package:amica/src/shared/filters/filter_card.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_select.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EventSearchFilter extends StatefulWidget {
  final UserProfile profile;
  final EventService eventService;

  const EventSearchFilter({
    super.key,
    required this.eventService,
    required this.profile,
  });

  @override
  State<EventSearchFilter> createState() => _EventSearchFilterState();
}

class _EventSearchFilterState extends State<EventSearchFilter> {
  late FormGroup _filterForm;

  Future<void> initializeFilters(UserProfile profile) async {
    await widget.eventService.initializeFilters(profile);
    setState(() {
      _filterForm = widget.eventService.eventSearchFilterForm;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeFilters(widget.profile);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Align(
        alignment: Alignment.center,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          shrinkWrap: true,
          children: [
            AmicaFilterCard(
              title: 'Distance',
              valueTitle: 'up to',
              enabledTitle: 'Show people only in this range',
              max: 100,
              min: 1,
              typeOfInput: FilterInputs.slider,
              control: widget.eventService.eventSearchFilterForm
                  .control('distance') as FormControl<double>,
            ),
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaFilterCard(
                title: 'Age',
                valueTitle: '',
                enabledTitle: 'Show people only within this range',
                max: 100,
                min: 18,
                typeOfInput: FilterInputs.range,
                control: widget.eventService.eventSearchFilterForm
                    .control('age') as FormControl<AgeRange>),
            const Gap(verticalGap: 16, horizontalGap: 0),
            AmicaSelect<String>(
              initialValue: widget.eventService.eventSearchFilterForm
                  .control('lookingFor')
                  .value
                  .toString(),
              options: lookingFors.values,
              fieldName: 'Show me events created by',
            ),
          ],
        ),
      ),
    );
  }
}
