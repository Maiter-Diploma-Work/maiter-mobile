import 'package:flutter/material.dart';
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
  void dislikePressed() {}

  void settingsPressed() {}

  void likePressed() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 42.0, right: 42.0, top: 14.0),
      child: Column(
        children: [
          const ProfilePicture(pictureUrl: 'assets/anna_shapovalova.PNG'),
          //Profile info
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, left: 30, right: 30, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.profile.name,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            )),
                        Text(widget.profile.age.toString(),
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 26),
                          child: Icon(Icons.place_outlined),
                        ),
                        Text(
                          widget.profile.location.name,
                          style: const TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8.0, left: 30, right: 30),
                    child: Text(
                      widget.profile.description,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ProfileActionPanel(
            iconButtons: [
              IconButton(
                icon: const Icon(Icons.thumb_down, color: Colors.indigo),
                onPressed: dislikePressed,
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: settingsPressed,
              ),
              IconButton(
                icon: const Icon(Icons.thumb_up, color: Colors.pink),
                onPressed: likePressed,
              ),
            ],
          )
        ],
      ),
    );
  }
}
