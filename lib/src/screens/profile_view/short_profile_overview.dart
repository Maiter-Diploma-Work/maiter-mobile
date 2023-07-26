import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maiter/src/models/profiles/user_profile.dart';
import 'package:maiter/src/shared/delimeter.dart';
import 'package:maiter/src/shared/inputs/maiter_button.dart';
import 'package:maiter/src/shared/profile/profile_picture.dart';
import 'package:maiter/src/shared/profile/user_profile_name.dart';

class ShortProfileOverview extends StatefulWidget {
  final UserProfile profile;

  const ShortProfileOverview({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  _ShortProfileOverviewState createState() => _ShortProfileOverviewState();
}

class _ShortProfileOverviewState extends State<ShortProfileOverview> {
  final TextStyle textStyle = const TextStyle(
    fontSize: 14,
  );

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
            MaiterButton(
              onPressed: () => context.go('/profile/edit'),
              text: 'Edit profile',
              color: Theme.of(context).colorScheme.primary,
            ),
            MaiterButton(
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
          pictureUrl: widget.profile.photo,
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
    int birthYear = widget.profile.birthDate.year,
        birthMonth = widget.profile.birthDate.month,
        birthDay = widget.profile.birthDate.day;

    String locationName = widget.profile.location.name,
        countryName = widget.profile.location.countryName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        UserProfileName(
          name: widget.profile.name,
          age: widget.profile.age,
          tag: widget.profile.tag,
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
