import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maiter/src/models/profiles/user_profile.dart';
import 'package:maiter/src/shared/gap.dart';
import 'package:maiter/src/shared/inputs/maiter_round_icon_button.dart';
import 'package:maiter/src/shared/profile/interests.dart';
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

  void detailsPressed() {}

  void likePressed() {}

  void onHorizontalDrag(DragUpdateDetails details) {
    int sensitivity = 8;
    if (details.delta.dx > sensitivity) {
      // Right Swipe
      debugPrint('Right Swipe, $sensitivity');
    } else if (details.delta.dx < -sensitivity) {
      //Left Swipe
      debugPrint('Left Swipe, $sensitivity');
    }
  }

  void onVerticalDrag(DragUpdateDetails details, BuildContext context) {
    int sensitivity = 8;
    if (details.delta.dy > sensitivity) {
      // Right Swipe
      debugPrint('Up Swipe, $sensitivity');
    } else if (details.delta.dy < -sensitivity) {
      //Left Swipe
      debugPrint('Down Swipe, $sensitivity');
      context.go('/search/user/details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) => onHorizontalDrag(details),
      onVerticalDragUpdate: (details) => onVerticalDrag(details, context),
      child: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Color(0xFF131111),
          //     Color(0xFF110E32),
          //     Color(0xFF161E6C),
          //   ],
          // ),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Stack(
          children: [
            Center(
              child: ProfilePicture(
                pictureUrl: 'assets/valentyn_kushnirow.jpg',
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              child: generateProfileInfo(context),
            ),
            Positioned(
              bottom: 48.0,
              right: 16.0,
              child: generateActions(context),
            )
          ],
        ),
      ),
    );
  }

  Widget generateProfileInfo(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserProfileName(
            name: widget.profile.name,
            age: widget.profile.age,
            tag: widget.profile.tag,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
          ),
          Interests(
            interests: widget.profile.interests,
            displayAmount: 4,
          )
        ],
      ),
    );
  }

  Widget generateActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaiterRoundIconButton(
          onTap: () => {},
          fillColor: Theme.of(context).colorScheme.error,
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        const Gap.cubic(28),
        MaiterRoundIconButton(
          onTap: () => context.go('/search/user/details'),
          fillColor: Theme.of(context).colorScheme.tertiary,
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        const Gap.cubic(28),
        MaiterRoundIconButton(
          onTap: () => {},
          fillColor: const Color(0xFF2AB5AE),
          icon: const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
