import 'package:amica/src/screens/profile_view/profile_edit_view/expectation.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ExpectationsList extends StatefulWidget {
  final FormArray<String> expectations;

  const ExpectationsList({super.key, required this.expectations});

  @override
  State<ExpectationsList> createState() => _ExpectationsListState();
}

class _ExpectationsListState extends State<ExpectationsList> {
  late final FormArray<String> _array;

  void addExpectation() {
    setState(() {
      _array.add(FormControl<String>(value: ''));
    });
  }

  void removeExpectations(int idx) {
    setState(() {
      _array.removeAt(idx);
    });
  }

  @override
  void initState() {
    super.initState();
    _array = widget.expectations;
  }

  @override
  Widget build(BuildContext context) {
    if (_array.controls.isEmpty) {
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
          _array.controls.map(
            (e) => Column(
              children: [
                Expectation(
                  idx: _array.controls.indexOf(e),
                  onRemove: removeExpectations,
                  onAdd: addExpectation,
                  control: e as FormControl<String>,
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
