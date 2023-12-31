import 'package:flutter/material.dart';

typedef OnUpdate = void Function(DateTime newDate);

class AmicaDatepicker extends StatefulWidget {
  final DateTime initialDate;
  final String fieldName;
  final OnUpdate? onUpdate;

  const AmicaDatepicker({
    super.key,
    required this.initialDate,
    required this.fieldName,
    this.onUpdate,
  });

  @override
  State<AmicaDatepicker> createState() => _AmicaDatepickerState();
}

class _AmicaDatepickerState extends State<AmicaDatepicker> {
  DateTime? inputDate;

  String get date {
    if (inputDate == null) {
      return '${widget.initialDate.year} : ${widget.initialDate.month} : ${widget.initialDate.day}';
    } else {
      return '${inputDate!.year} : ${inputDate!.month} : ${inputDate!.day}';
    }
  }

  void _pickDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: inputDate ?? widget.initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (newDate != null) {
      setState(() {
        inputDate = newDate;
      });
      widget.onUpdate!(newDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          widget.fieldName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: _pickDate,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            textStyle: const TextStyle(
              fontSize: 16,
            ),
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          child: Text(date),
        ),
      ],
    );
  }
}
