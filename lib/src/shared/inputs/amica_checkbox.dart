import 'package:amica/src/shared/gap.dart';
import 'package:flutter/material.dart';

typedef OnCheck = void Function(bool isChecked);

class AmicaCheckbox extends StatefulWidget {
  final String label;
  final OnCheck onCheck;
  const AmicaCheckbox({super.key, required this.label, required this.onCheck});

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
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          checkColor: Colors.black,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
            widget.onCheck(isChecked);
          },
        ),
        Text(widget.label),
      ],
    );
  }
}
