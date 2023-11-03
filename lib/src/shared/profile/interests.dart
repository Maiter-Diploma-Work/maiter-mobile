import 'package:amica/src/shared/interest_view.dart';
import 'package:flutter/material.dart';

import '../../models/shared/interest.dart';

class Interests extends StatelessWidget {
  final List<Interest> interests;
  final List<Interest>? userInterests;
  final int? displayAmount;

  Interests({
    super.key,
    required this.interests,
    this.displayAmount,
    this.userInterests,
  }) {
    interests.sort((a, b) => a.name.length.compareTo(b.name.length));
  }

  Color? getInterestColor(Interest interest, BuildContext context) {
    if (userInterests == null) {
      return null;
    }

    if (userInterests!.any((element) =>
        element.name.toLowerCase() == interest.name.toLowerCase())) {
      return Theme.of(context).colorScheme.secondary;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      runSpacing: 7,
      spacing: 10,
      children: List.generate(
        displayAmount ?? interests.length,
        (index) => InterestView(
          interest: interests[index],
          color: getInterestColor(interests[index], context),
        ),
      ),
    );
  }
}
