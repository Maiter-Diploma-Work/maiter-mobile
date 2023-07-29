import 'package:flutter/material.dart';

import '../../models/shared/interest.dart';

class Interests extends StatefulWidget {
  final List<Interest> interests;
  final int? displayAmount;

  const Interests({
    super.key,
    required this.interests,
    this.displayAmount,
  });

  @override
  State<StatefulWidget> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  BoxDecoration boxDecoration = const BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
    color: Color(0x99616161),
  );

  Widget interestTextGenerator(int index) {
    return Text(
      widget.interests[index].name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  List<Widget> listGenerator() {
    return List.generate(
      widget.displayAmount ?? widget.interests.length,
      (index) => Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
        decoration: boxDecoration,
        child: interestTextGenerator(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 7,
      spacing: 20,
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      children: listGenerator(),
    );
  }
}
