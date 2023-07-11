import 'package:flutter/material.dart';

import '../../models/shared/interest.dart';

class Interests extends StatefulWidget {
  final List<Interest> interests;

  const Interests({super.key, required this.interests});

  @override
  State<StatefulWidget> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  BoxDecoration boxDecoration = BoxDecoration(
    border: Border.all(width: 1.0, color: Colors.grey),
    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
  );

  Widget interestTextGenerator(int index) {
    return Text(
      widget.interests[index].name,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  List<Widget> listGenerator() {
    return List.generate(
      widget.interests.length,
      (index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        decoration: boxDecoration,
        child: interestTextGenerator(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 4.0),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: listGenerator(),
      ),
    );
  }
}
