import 'package:flutter/material.dart';

class AmicaSwitch extends StatefulWidget {
  const AmicaSwitch({super.key});

  @override
  State<AmicaSwitch> createState() => _AmicaSwitchState();
}

class _AmicaSwitchState extends State<AmicaSwitch> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.amber;
        }
        return null;
      },
    );

    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Material color when switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        return null;
      },
    );

    return Switch(
      value: checked,
      overlayColor: overlayColor,
      trackColor: trackColor,
      thumbColor: const MaterialStatePropertyAll<Color>(Colors.white),
      onChanged: (bool value) {
        setState(() {
          checked = value;
        });
      },
    );
  }
}
