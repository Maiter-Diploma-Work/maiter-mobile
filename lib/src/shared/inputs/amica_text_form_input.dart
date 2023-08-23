import 'package:flutter/material.dart';

class AmicaTextFormInput extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final String? initialValue;
  final EdgeInsets? padding;
  final int? maxLines;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final bool? isExpanded;

  const AmicaTextFormInput({
    super.key,
    required this.fieldName,
    required this.hintText,
    this.padding,
    this.maxLines,
    this.initialValue,
    this.textInputType,
    this.controller,
  }) : isExpanded = false;

  const AmicaTextFormInput.expanded({
    super.key,
    required this.fieldName,
    required this.hintText,
    this.padding,
    this.maxLines,
    this.initialValue,
    this.textInputType,
    this.controller,
  }) : isExpanded = true;

  Widget get input {
    final Widget userInput = TextFormField(
      keyboardType: textInputType,
      initialValue: initialValue,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        hintStyle: const TextStyle(
          color: Color(0x99FFFFFF),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      controller: controller,
      textAlign: TextAlign.center,
    );

    final Widget userInputWithFieldName = Column(
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
        userInput,
      ],
    );

    return fieldName.isNotEmpty ? userInputWithFieldName : userInput;
  }

  Widget get formField {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: input,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isExpanded == true) {
      return Expanded(child: formField);
    }

    return formField;
  }
}
