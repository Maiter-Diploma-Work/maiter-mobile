import 'package:flutter/material.dart';
import 'package:maiter/shared/profile/description.dart';
import 'package:maiter/shared/profile/interests.dart';
import 'package:maiter/shared/profile/location.dart';
import 'package:maiter/user_profile_view/user_profile_name.dart';
import '../models/profiles/user_profile.dart';
import '../shared/profile/profile_action_panel.dart';
import '../shared/profile/profile_picture.dart';

class UserProfileView extends StatefulWidget {
  final UserProfile profile;

  const UserProfileView({super.key, required this.profile});

  @override
  State<StatefulWidget> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(14.0),
  );

  void dislikePressed() {}

  void settingsPressed() {}

  void likePressed() {}

  List<Widget> bodyContentGenerator() {
    return [
      UserProfileName(name: widget.profile.name, age: widget.profile.age),
      LocationView(location: widget.profile.location),
      ProfileDescription(description: widget.profile.description),
      Interests(interests: widget.profile.interests)
    ];
  }

  Widget bodyGenerator() {
    return Card(
      shape: shape,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
        child: Column(
          children: bodyContentGenerator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.only(
          left: 42.0,
          right: 42.0,
          top: 14.0,
          bottom: 64.0,
        ),
        children: [
          const ProfilePicture(pictureUrl: 'assets/anna_shapovalova.PNG'),
          bodyGenerator(),
          ProfileActionPanel(
            iconButtons: [
              IconButton(
                icon: Icon(
                  Icons.thumb_down,
                  color: Theme.of(context).colorScheme.error,
                ),
                onPressed: dislikePressed,
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: settingsPressed,
              ),
              IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: likePressed,
              ),
            ],
          )
        ],
      ),
    );
  }
}
