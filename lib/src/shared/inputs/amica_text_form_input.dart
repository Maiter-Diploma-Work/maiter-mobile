import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AmicaTextFormInput extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final String? initialValue;
  final EdgeInsets? padding;
  final int? maxLines;
  final TextInputType? textInputType;
  final FormControl? controller;
  final bool? isExpanded;
  final bool? isPassword;

  const AmicaTextFormInput({
    super.key,
    required this.fieldName,
    required this.hintText,
    this.padding,
    this.maxLines,
    this.initialValue,
    this.textInputType,
    this.controller,
    this.isPassword,
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
    this.isPassword,
  }) : isExpanded = true;

  Widget getInput(BuildContext context) {
    final Widget userInput = ReactiveTextField(
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: UnderlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide(
            width: 4,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      formControl: controller,
      textAlign: TextAlign.center,
    );

    final Widget userInputWithFieldName = Column(
      children: [
        Text(
          fieldName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            // color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
        userInput,
      ],
    );

    return fieldName.isNotEmpty ? userInputWithFieldName : userInput;
  }

  Widget getFromField(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: getInput(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isExpanded == true) {
      return Expanded(child: getFromField(context));
    }

    return getFromField(context);
  }
}
