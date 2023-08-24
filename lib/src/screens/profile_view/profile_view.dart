import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/screens/profile_view/link_button.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:flutter/material.dart';

import 'short_profile_overview.dart';

class ProfileView extends StatefulWidget {
  final UserProfile profile;

  const ProfileView({super.key, required this.profile});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<LinkButton> interactionOptions = [
    //TODO: dynamic items!
    const LinkButton(
      title: 'Interests',
      location: '/profile/interests',
    ),
    const LinkButton(
      title: 'Theme',
      selectedTitle: 'Standart',
      location: '/profile/theme',
    ),
    const LinkButton(
      title: 'Language',
      selectedTitle: 'English',
      location: '/profile/language',
    ),
    const LinkButton(
      title: 'Contacts',
      location: '/profile',
    ),
    const LinkButton(
      title: 'Devices',
      location: '/profile',
    ),
    const LinkButton(
      title: 'Status',
      location: '/profile',
    ),
    const LinkButton(
      title: 'Privacy',
      location: '/profile',
    ),
  ];

  Widget generateColumnItem(
      String title, String? selectedTitle, String location) {
    return Column(
      children: [
        LinkButton(
          title: title,
          selectedTitle: selectedTitle,
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
        ShortProfileOverview(profile: widget.profile),
        const Gap.cubic(26),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            interactionOptions.length,
            (index) => generateColumnItem(
              interactionOptions[index].title,
              interactionOptions[index].selectedTitle,
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
