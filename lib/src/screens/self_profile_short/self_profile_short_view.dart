import 'package:flutter/material.dart';
import 'package:maiter/src/models/profiles/user_profile.dart';
import 'package:maiter/src/shared/profile/profile_picture.dart';
import 'package:maiter/src/shared/profile/user_profile_name.dart';

class SelfProfileShortView extends StatefulWidget {
  final UserProfile profile;
  const SelfProfileShortView({super.key, required this.profile});

  @override
  State<StatefulWidget> createState() => _SelfProfileShortViewState();
}

class _SelfProfileShortViewState extends State<SelfProfileShortView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 12.0,
              offset: Offset(3, 6),
            ),
          ],
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(Radius.circular(14.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 64,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: ProfilePicture(
              pictureUrl: widget.profile.photo,
              hasBoxShadow: false,
              isRound: true,
            ),
          ),
          Expanded(
            child: UserProfileName(
              name: widget.profile.name,
              age: widget.profile.age,
              tag: widget.profile.tag,
            ),
          ),
        ],
      ),
    );
  }
}
