import 'package:amica/src/models/shared/interest.dart';
import 'package:amica/src/shared/interests_list/interests_list.dart';
import 'package:flutter/material.dart';

class RegistrationInterests extends StatefulWidget {
  final List<Interest> selectedInterests;

  const RegistrationInterests({
    super.key,
    required this.selectedInterests,
  });

  @override
  State<RegistrationInterests> createState() => _RegistrationInterestsState();
}

class _RegistrationInterestsState extends State<RegistrationInterests> {
  @override
  Widget build(BuildContext context) {
    return InterestsListSelect(
      isRegistrations: true,
      selectedInterests: widget.selectedInterests,
    );
  }
}
