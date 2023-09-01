import 'package:amica/src/models/profiles/expectancies.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/screens/profile_view/profile_edit_view/expectation.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:flutter/material.dart';

class ExpectationsList extends StatefulWidget {
  final UserProfile profile;
  const ExpectationsList({super.key, required this.profile});

  @override
  State<ExpectationsList> createState() => _ExpectationsListState();
}

class _ExpectationsListState extends State<ExpectationsList> {
  late List<Expectancy> _expectationsSource = widget.profile.expectancies;
  late int _newExpectancyId;

  void addExpectation() {
    setState(() {
      _expectationsSource = [
        ..._expectationsSource,
        Expectancy(
          id: _newExpectancyId + 1,
          userId: widget.profile.id,
          text: '',
        ),
      ];
      _newExpectancyId++;
    });
  }

  void removeExpectations(int expectationId) {
    //TODO: fix this method. It removes the right item, but the display is incorect unless user reentering this view
    setState(() {
      _expectationsSource.removeWhere((element) => element.id == expectationId);
    });
  }

  @override
  void initState() {
    super.initState();
    _newExpectancyId = _expectationsSource.length;
  }

  @override
  Widget build(BuildContext context) {
    if (_expectationsSource.isEmpty) {
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
          _expectationsSource.map(
            (e) => Column(
              children: [
                Expectation(
                  onRemove: removeExpectations,
                  onAdd: addExpectation,
                  expectancy: e,
                ),
                const Gap(verticalGap: 16, horizontalGap: 0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
