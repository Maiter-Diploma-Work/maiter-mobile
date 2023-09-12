import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/models/shared/location.dart';
import 'package:amica/src/shared/inputs/amica_round_icon_button.dart';
import 'package:amica/src/shared/profile/interests.dart';
import 'package:amica/src/shared/profile/location.dart';
import 'package:amica/src/shared/profile/profile_picture.dart';
import 'package:amica/src/shared/profile/user_profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class UserProfileView extends StatefulWidget {
  final String profileId;

  const UserProfileView({super.key, required this.profileId});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final int _sensitivity = 8;
  UserProfile? _profile;

  void _dislikePressed() {}

  void _detailsPressed(BuildContext context) {
    context.go('/search/user/details');
  }

  void _likePressed() {}

  void _onHorizontalDrag(DragUpdateDetails details) {
    if (details.delta.dx > _sensitivity) {
      // Right Swipe
      debugPrint('Right Swipe, $_sensitivity');
      _likePressed();
    } else if (details.delta.dx < -_sensitivity) {
      //Left Swipe
      debugPrint('Left Swipe, $_sensitivity');
      _dislikePressed();
    }
  }

  void _onVerticalDrag(DragUpdateDetails details, BuildContext context) {
    if (details.delta.dy > _sensitivity) {
      // Right Swipe
      debugPrint('Up Swipe, $_sensitivity');
    } else if (details.delta.dy < -_sensitivity) {
      //Left Swipe
      debugPrint('Down Swipe, $_sensitivity');
      _detailsPressed(context);
    }
  }

  Future<void> readMockUserFromJson() async {
    final int userId = int.parse(widget.profileId);
    final String response =
        await rootBundle.loadString('assets/mock_users.json');
    final List<UserProfile> data = usersFromJson(response);
    setState(() {
      _profile = data.firstWhere((element) => element.id == userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) => _onHorizontalDrag(details),
      onVerticalDragUpdate: (details) => _onVerticalDrag(details, context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        child: Stack(
          children: [
            Center(
              child: ProfilePicture(
                pictureUrl: _profile == null ? 'assets/logo/logo.png' : _profile!.photo,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: generateProfileInfo(context),
              ),
            ),
            _dislikeButton(context),
            _detailsButton(context),
            _likeButton(context),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    readMockUserFromJson();
  }

  Widget generateProfileInfo(BuildContext context) {
    int interestsDisplayAmount = 0;
    if (_profile != null) {
      if (_profile!.interests.length <= 6) {
        interestsDisplayAmount = _profile!.interests.length;  
      } else {
       interestsDisplayAmount = 6; 
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UserProfileName.fromProfile(
          _profile ?? UserProfile.empty(),
          padding: const EdgeInsets.only(
            right: 32,
          ),
        ),
        LocationView(location: _profile == null? Location.empty() : _profile!.location),
        Interests(
          interests: _profile == null? [] : _profile!.interests,
          displayAmount: interestsDisplayAmount,
        ),
      ],
    );
  }

  Widget _dislikeButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AmicaRoundIconButton(
          onTap: () => _dislikePressed,
          fillColor: Theme.of(context).colorScheme.error.withOpacity(0.5),
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _detailsButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AmicaRoundIconButton(
          onTap: () => context.go('/search/${widget.profileId}/details', extra: _profile),
          fillColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _likeButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AmicaRoundIconButton(
          onTap: () => _likePressed,
          fillColor: const Color.fromARGB(126, 42, 181, 49),
          icon: const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
