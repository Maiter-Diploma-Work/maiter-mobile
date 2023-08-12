import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/delimeter.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/profile/profile_picture.dart';
import 'package:amica/src/shared/profile/user_profile_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShortProfileOverview extends StatelessWidget {
  final TextStyle textStyle = const TextStyle(
    fontSize: 14,
  );

  final UserProfile profile;

  const ShortProfileOverview({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: generateCardBody(),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            AmicaButton(
              onPressed: () => context.go('/profile/edit'),
              text: 'Edit profile',
              color: Theme.of(context).colorScheme.primary,
            ),
            AmicaButton(
              onPressed: () {},
              text: 'Save',
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ],
    );
  }

  Widget generateCardBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        ProfilePicture(
          pictureUrl: profile.photo,
          isRound: true,
          radius: 50,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 0,
            ),
            child: generateProfileInfo(),
          ),
        )
      ],
    );
  }

  Column generateProfileInfo() {
    int birthYear = profile.birthDate.year,
        birthMonth = profile.birthDate.month,
        birthDay = profile.birthDate.day;

    String locationName = profile.location.name,
        countryName = profile.location.countryName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        UserProfileName(
          name: profile.name,
          birthdate: profile.birthDate,
          tag: profile.tag,
        ),
        const Delimeter(bottomMargin: 12, topMargin: 6),
        Text(
          "$locationName, $countryName",
          style: textStyle,
        ),
        Text(
          "$birthYear : $birthMonth : $birthDay",
          style: textStyle,
        ),
      ],
    );
  }
}
