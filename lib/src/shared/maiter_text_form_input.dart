import 'package:flutter/material.dart';

class MaiterTextFormInput extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final EdgeInsets? padding;

  const MaiterTextFormInput(
      {super.key,
      required this.fieldName,
      required this.hintText,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Column(
        children: [
          Text(
            fieldName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}
