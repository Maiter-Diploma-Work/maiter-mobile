import 'package:flutter/material.dart';

class MaiterTextFormInput extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final String? initialValue;
  final EdgeInsets? padding;
  final int? maxLines;

  const MaiterTextFormInput({
    super.key,
    required this.fieldName,
    required this.hintText,
    this.padding,
    this.maxLines,
    this.initialValue,
  });

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
          TextFormField(
            initialValue: initialValue,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              hintStyle: const TextStyle(color: Color(0x99FFFFFF)),
            ),
          ),
        ],
      ),
    );
  }
}
