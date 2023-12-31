import 'package:amica/src/models/filters/range.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AmicaRange extends StatefulWidget {
  final double max;
  final double min;
  final String title;
  final FormControl? control;

  const AmicaRange({
    super.key,
    required this.max,
    required this.min,
    required this.title,
    this.control,
  });

  @override
  State<AmicaRange> createState() => _AmicaRangeState();
}

class _AmicaRangeState extends State<AmicaRange> {
  late RangeValues values;

  @override
  void initState() {
    super.initState();
    values = RangeValues(widget.min, widget.max);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.title),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.control!.value.min.toString()),
            Expanded(
              child: RangeSlider(
                values: values,
                max: widget.max,
                min: widget.min,
                activeColor: Theme.of(context).colorScheme.onBackground,
                inactiveColor: Theme.of(context).colorScheme.onBackground,
                labels:
                    RangeLabels(values.start.toString(), values.end.toString()),
                onChanged: (newValues) {
                  setState(() {
                    values = newValues;
                    if (widget.control != null) {
                      widget.control!.value = Range(
                        max: newValues.end.toInt(),
                        min: newValues.start.toInt(),
                      );
                    }
                  });
                },
              ),
            ),
            Text(widget.control!.value.max.toString()),
          ],
        ),
      ],
    );
  }
}
