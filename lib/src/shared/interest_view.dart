import 'package:amica/src/models/shared/interest.dart';
import 'package:flutter/material.dart';

typedef OnTap = void Function(Interest element);

class InterestView extends StatefulWidget {
  final Interest interest;
  final OnTap? onTap;

  const InterestView({
    super.key,
    required this.interest,
    this.onTap,
  });

  @override
  State<InterestView> createState() => _InterestViewState();
}

class _InterestViewState extends State<InterestView> {
  BoxDecoration boxDecoration = const BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
    color: Color(0x99616161),
  );

  Widget interestTextGenerator() {
    return Text(
      widget.interest.name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap != null ? widget.onTap!(widget.interest) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
        decoration: boxDecoration,
        child: interestTextGenerator(),
      ),
    );
  }
}
