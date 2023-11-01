import 'package:amica/src/services/auth/auth.service.dart';
import 'package:amica/src/shared/interests_list/interests_list.dart';
import 'package:flutter/material.dart';

class RegistrationInterests extends StatefulWidget {
  final AuthService authService;

  const RegistrationInterests({
    super.key,
    required this.authService,
  });

  @override
  State<RegistrationInterests> createState() => _RegistrationInterestsState();
}

class _RegistrationInterestsState extends State<RegistrationInterests> {
  @override
  Widget build(BuildContext context) {
    return InterestsListSelect(
      selectedInterests: widget.authService.selectedInterests,
      favoriteSongControl: widget.authService.favoriteSong,
    );
  }
}
