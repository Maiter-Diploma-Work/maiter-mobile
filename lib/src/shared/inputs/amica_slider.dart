import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AmicaSlider extends StatefulWidget {
  final double max;
  final double min;
  final String title;
  final FormControl control;

  const AmicaSlider({
    super.key,
    required this.max,
    required this.min,
    required this.title,
    required this.control,
  });

  @override
  State<AmicaSlider> createState() => _AmicaSliderState();
}

class _AmicaSliderState extends State<AmicaSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('${widget.title} (${widget.control.value.toInt().toString()})'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.min.toInt().toString()),
            Expanded(
              child: Slider(
                value: widget.control.value,
                max: widget.max,
                min: widget.min,
                activeColor: Theme.of(context).colorScheme.onBackground,
                inactiveColor: Theme.of(context).colorScheme.onBackground,
                onChanged: (newValue) {
                  setState(() {
                    if (widget.control != null) {
                      widget.control.value = newValue;
                    }
                  });
                },
              ),
            ),
            Text(widget.max.toInt().toString()),
          ],
        ),
      ],
    );
  }
}
