import 'package:amica/src/models/DTO/dislike_dto.dart';
import 'package:amica/src/models/DTO/like_dto.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/models/shared/location.dart';
import 'package:amica/src/services/like/like.service.dart';
import 'package:amica/src/services/profile/mock_profile.service.dart';
import 'package:amica/src/services/profile/profile.service.dart';
import 'package:amica/src/services/user/user_search.service.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_round_icon_button.dart';
import 'package:amica/src/shared/profile/interests.dart';
import 'package:amica/src/shared/profile/location.dart';
import 'package:amica/src/shared/profile/profile_picture.dart';
import 'package:amica/src/shared/profile/user_profile_name.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class UserProfileView extends StatefulWidget {
  final UserSearchService userService;
  final ProfileService profileService;
  final LikeService likeService;

  const UserProfileView({
    super.key,
    required this.userService,
    required this.likeService,
    required this.profileService,
  });

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  UserProfile? _currentProfile;
  List<UserProfile> _profiles = [];
  late final int userId;

  void _dislikePressed() {
    DislikeDto dislike = DislikeDto(
      id: -1,
      firstUserId: userId,
      secondUserId: _currentProfile != null ? _currentProfile!.id : -1,
    );
    widget.likeService.dislikeUser(dislike);

    if (_profiles.isNotEmpty) {
      setState(() {
        _profiles.removeAt(0);
        _currentProfile = _profiles.isEmpty ? null : _profiles.first;
      });
    }
  }

  void _detailsPressed(BuildContext context) {
    context.go('/search/details', extra: _currentProfile);
  }

  void _likePressed() {
    LikeDto like = LikeDto(
      id: -1,
      firstUserId: userId,
      secondUserId: _currentProfile != null ? _currentProfile!.id : -1,
    );
    widget.likeService.likeUser(like);

    if (_profiles.isNotEmpty) {
      setState(() {
        _profiles.removeAt(0);
        _currentProfile = _profiles.isEmpty ? null : _profiles.first;
      });
    }
  }

  void _onHorizontalDrag(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      _likePressed();
    } else if (details.primaryVelocity! > 0) {
      _dislikePressed();
    }
  }

  Future<void> _initState() async {
    if (widget.userService.users.isEmpty) {
      await widget.userService.getRandomUsers(
        widget.profileService.userProfile!,
      );
    }

    setState(() {
      _profiles = widget.userService.users;
      if (_profiles.isNotEmpty) {
        _currentProfile = widget.userService.users.first;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    userId = widget.profileService.userProfile!.id;
    _initState();
  }

  @override
  Widget build(BuildContext context) {
    const double maxImageHeight = 512;
    return _currentProfile == null
        ? const Center(
            child: Text(
              'That\'s all :(',
              style: TextStyle(fontSize: 32),
            ),
          )
        : GestureDetector(
            onHorizontalDragEnd: (details) => _onHorizontalDrag(details),
            child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  children: [
                    SizedBox(
                      height: maxImageHeight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ProfilePicture(
                            pictureUrl: _currentProfile == null
                                ? 'assets/logo/logo.png'
                                : _currentProfile!.photo,
                          ),
                          _detailsButton(context),
                          _likeButton(context),
                          _dislikeButton(context),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 16.0,
                      ),
                      child: generateProfileInfo(context),
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  Widget generateProfileInfo(BuildContext context) {
    int interestsDisplayAmount = 0;
    if (_currentProfile != null) {
      if (_currentProfile!.interests.length <= 4) {
        interestsDisplayAmount = _currentProfile!.interests.length;
      } else {
        interestsDisplayAmount = 4;
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UserProfileName.fromProfile(
          _currentProfile ?? UserProfile.empty(),
          padding: const EdgeInsets.only(
            right: 32,
          ),
        ),
        LocationView(
          location: _currentProfile == null
              ? Location.empty()
              : _currentProfile!.location,
        ),
        Container(
          color: Theme.of(context).colorScheme.inverseSurface,
          width: MediaQuery.of(context).size.width * 0.5,
          height: 1,
        ),
        const Gap(verticalGap: 8.0, horizontalGap: 0),
        Interests(
          interests: _currentProfile == null ? [] : _currentProfile!.interests,
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
          onTap: _dislikePressed,
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
          onTap: () => _detailsPressed(context),
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
          onTap: _likePressed,
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
