import 'package:amica/src/shared/interest_view.dart';
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
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      runSpacing: 7,
      spacing: 10,
      // alignment: WrapAlignment.spaceBetween,
      // runAlignment: WrapAlignment.spaceBetween,
      children: List.generate(
        widget.displayAmount ?? widget.interests.length,
        (index) => InterestView(
          interest: widget.interests[index],
        ),
      ),
    );
  }
}
