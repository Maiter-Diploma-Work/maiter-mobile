import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef OnCheck = void Function(bool isChecked);

class AmicaCheckbox extends StatefulWidget {
  final String label;
  final OnCheck onCheck;
  final FormControl<bool> control;

  const AmicaCheckbox(
      {super.key,
      required this.label,
      required this.onCheck,
      required this.control});

  @override
  State<AmicaCheckbox> createState() => _AmicaCheckboxState();
}

class _AmicaCheckboxState extends State<AmicaCheckbox> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ReactiveCheckbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          checkColor: Colors.black,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          formControl: widget.control,
        ),
        Text(widget.label),
      ],
    );
  }
}
