import 'package:amica/src/models/shared/interest.dart';
import 'package:amica/src/screens/filters/interests_chip_list.dart';
import 'package:amica/src/shared/card.dart';
import 'package:amica/src/shared/inputs/amica_switch.dart';
import 'package:flutter/material.dart';

enum FilterInputs {
  slider,
  range,
  interests,
}

class AmicaFilterCard extends StatefulWidget {
  final String title;
  final String valueTitle;
  final String enabledTitle;
  final double min;
  final double max;
  final FilterInputs typeOfInput;

  const AmicaFilterCard({
    super.key,
    required this.title,
    required this.min,
    required this.max,
    required this.enabledTitle,
    required this.valueTitle,
    required this.typeOfInput,
  });

  @override
  State<AmicaFilterCard> createState() => _AmicaFilterCardState();
}

class _AmicaFilterCardState extends State<AmicaFilterCard> {
  late double value = 1;
  late RangeValues values = RangeValues(widget.min, widget.max);
  late bool enabled = false;
  late List<Interest> interests = [
    Interest(id: 1, profileId: 1, name: 'a', category: 'b'),
    Interest(id: 2, profileId: 1, name: 'b', category: 'b'),
    Interest(id: 3, profileId: 1, name: 'c', category: 'b'),
    Interest(id: 4, profileId: 1, name: 'd', category: 'b'),
    Interest(id: 5, profileId: 1, name: 'e', category: 'b'),
    Interest(id: 6, profileId: 1, name: 'f', category: 'b'),
    Interest(id: 7, profileId: 1, name: 'g', category: 'b'),
    Interest(id: 8, profileId: 1, name: 'h', category: 'b'),
    Interest(id: 9, profileId: 1, name: 'i', category: 'b'),
    Interest(id: 10, profileId: 1, name: 'j', category: 'b'),
  ];

  Widget get input {
    switch (widget.typeOfInput) {
      case FilterInputs.range:
        return RangeSlider(
          max: widget.max,
          min: widget.min,
          activeColor: Theme.of(context).colorScheme.onBackground,
          inactiveColor: Theme.of(context).colorScheme.onBackground,
          values: values,
          onChanged: (values) {
            setState(() {
              this.values = values;
            });
          },
        );
      case FilterInputs.slider:
        return Slider.adaptive(
          value: value,
          max: widget.max,
          min: widget.min,
          activeColor: Theme.of(context).colorScheme.onBackground,
          thumbColor: Theme.of(context).colorScheme.onBackground,
          inactiveColor: Theme.of(context).colorScheme.onBackground,
          label: '$value',
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
        );
      case FilterInputs.interests:
        final TextEditingController controller = TextEditingController();
        return Container(
          constraints: BoxConstraints(
            minHeight: 64,
            maxHeight: 64 * 4,
            minWidth: MediaQuery.of(context).size.width - (38 + 16),
          ),
          decoration: const BoxDecoration(
            color: Color(0x99515151),
            borderRadius: BorderRadius.all(
              Radius.circular(21),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 4,
          ),
          margin: const EdgeInsets.only(top: 6),
          child: InterestsChipList(
            interests: interests,
            onUpdate: (interests) {
              setState(() {
                this.interests = interests;
              });
            },
            newItemController: controller,
          ),
        );
      default:
        return Container();
    }
  }

  String get valueTitle {
    if (widget.typeOfInput == FilterInputs.range) {
      return '${widget.valueTitle} ${values.start.floor()}-${values.end.floor()}';
    } else if (widget.typeOfInput == FilterInputs.slider) {
      return '${widget.valueTitle} ${value.floor()}';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return AmicaCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                valueTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          input,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(widget.enabledTitle),
              const AmicaSwitch(),
            ],
          ),
        ],
      ),
    );
  }
}
