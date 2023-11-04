import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/screens/profile_view/link_button.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:flutter/material.dart';

import 'short_profile_overview.dart';

class ProfileView extends StatelessWidget {
  final UserProfile profile;

  ProfileView({super.key, required this.profile});

  final List<LinkButton> interactionOptions = [
    //TODO: dynamic items!
    const LinkButton(
      title: 'Edit Profile',
      location: '/profile/edit-menu/edit',
    ),
    const LinkButton(
      title: 'Edit Photos',
      location: '/profile/edit-menu/photos',
    ),
    const LinkButton(
      title: 'Interests',
      location: '/profile/edit-menu/interests',
    ),
    const LinkButton(
      title: 'Language',
      location: '/profile/edit-menu/language',
    ),
    const LinkButton(
      title: 'Theme',
      location: '/profile/edit-menu/theme',
    ),
  ];

  Widget generateColumnItem(String title, String location) {
    return Column(
      children: [
        LinkButton(
          title: title,
          location: location,
        ),
        const Gap.cubic(26),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        ShortProfileOverview(profile: profile),
        const Gap.cubic(26),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            interactionOptions.length,
            (index) => generateColumnItem(
              interactionOptions[index].title,
              interactionOptions[index].location,
            ),
          ),
        ),
        const Gap(verticalGap: 100, horizontalGap: 0),
        Column(
          children: [
            AmicaButton(
              onPressed: () {},
              text: 'Deactivate Profile',
              color: Theme.of(context).colorScheme.error,
            ),
          ],
        ),
      ],
    );
  }
}
