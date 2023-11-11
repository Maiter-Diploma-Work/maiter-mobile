import 'package:amica/src/services/auth/auth.service.dart';
import 'package:amica/src/services/profile/profile.service.dart';
import 'package:amica/src/shared/interests_list/interests_list.dart';
import 'package:flutter/material.dart';

class RegistrationInterests extends StatelessWidget {
  final ProfileService profileService;

  const RegistrationInterests({
    super.key,
    required this.profileService,
  });

  @override
  Widget build(BuildContext context) {
    return InterestsListSelect(
      profileService: profileService,
    );
  }
}
