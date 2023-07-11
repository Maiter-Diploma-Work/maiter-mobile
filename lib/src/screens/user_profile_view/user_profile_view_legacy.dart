import 'package:flutter/material.dart';
import 'package:maiter/src/models/profiles/user_profile.dart';
import 'package:maiter/src/shared/profile/description.dart';
import 'package:maiter/src/shared/profile/interests.dart';
import 'package:maiter/src/shared/profile/location.dart';
import 'package:maiter/src/shared/profile/profile_action_panel.dart';
import 'package:maiter/src/shared/profile/profile_picture.dart';
import 'package:maiter/src/shared/profile/user_profile_name.dart';

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
      UserProfileName(
          name: widget.profile.name,
          age: widget.profile.age,
          tag: widget.profile.tag),
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

  void onDrag(DragUpdateDetails details) {
    int sensitivity = 8;
    if (details.delta.dx > sensitivity) {
      // Right Swipe
      debugPrint('Right Swipe, $sensitivity');
    } else if (details.delta.dx < -sensitivity) {
      //Left Swipe
      debugPrint('Left Swipe, $sensitivity');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onHorizontalDragUpdate: onDrag,
        child: ListView(
          padding: const EdgeInsets.only(
            left: 42.0,
            right: 42.0,
            top: 22.0,
            bottom: 64.0,
          ),
          children: [
            ProfilePicture(pictureUrl: 'assets/anna_shapovalova.PNG'),
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
                  icon: const Icon(Icons.more_horiz),
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
      ),
    );
  }
}
