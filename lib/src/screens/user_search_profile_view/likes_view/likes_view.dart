import 'package:amica/src/models/DTO/like_dto.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/like/like.service.dart';
import 'package:amica/src/services/profile/profile.service.dart';
import 'package:amica/src/services/user/user_search.service.dart';
import 'package:amica/src/shared/inputs/amica_round_icon_button.dart';
import 'package:amica/src/shared/profile/location.dart';
import 'package:amica/src/shared/profile/user_profile_name.dart';
import 'package:flutter/material.dart';

class AmicaLikesView extends StatefulWidget {
  final ProfileService profileService;
  final UserSearchService userService;
  final LikeService likeService;

  const AmicaLikesView({
    super.key,
    required this.profileService,
    required this.userService,
    required this.likeService,
  });

  @override
  State<AmicaLikesView> createState() => _AmicaLikesViewState();
}

class _AmicaLikesViewState extends State<AmicaLikesView> {
  List<UserProfile> likedUsers = [];

  void _dislikePressed(int id) {
    setState(() {
      likedUsers.removeWhere((element) => element.id == id);
    });
  }

  void _likePressed(int id) {
    setState(() {
      likedUsers.removeWhere((element) => element.id == id);
    });
  }

  void _onProfileTap(UserProfile userProfile) {}

  Widget _dislikeButton(BuildContext context, int userId) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AmicaRoundIconButton(
        onTap: () => _dislikePressed(userId),
        fillColor: Theme.of(context).colorScheme.error.withOpacity(0.5),
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _likeButton(BuildContext context, int userId) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AmicaRoundIconButton(
        onTap: () => _likePressed(userId),
        fillColor: const Color.fromARGB(126, 42, 181, 49),
        icon: const Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _profilePhoto(BuildContext context, UserProfile e) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(34.0),
      child: Image(
        image: AssetImage(e.photo),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _profileTile(UserProfile profile, BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width * 0.5) - 32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () => _onProfileTap(profile),
                  child: _profilePhoto(context, profile),
                ),
              ),
              Positioned(
                width: (MediaQuery.of(context).size.width * 0.5) - 32,
                bottom: 5.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _dislikeButton(context, profile.id),
                    _likeButton(context, profile.id),
                  ],
                ),
              )
            ],
          ),
          UserProfileName.fromProfile(profile),
          LocationView(location: profile.location),
        ],
      ),
    );
  }

  Future<void> readMockLikesFromJson() async {
    List<LikeDto> likes = await widget.likeService
        .getLikesForUser(widget.profileService.userProfile!.id);
    List<int> likerIds = List.from(likes.map((e) => e.secondUserId));

    List<UserProfile> tmp = await widget.userService.getCertainUsers(likerIds);

    setState(() {
      likedUsers = tmp;
    });
  }

  @override
  void initState() {
    super.initState();
    readMockLikesFromJson();
  }

  @override
  Widget build(BuildContext context) {
    if (likedUsers.isEmpty) {
      return const Center(
        child: Text(
          'No one liked you...\n just yet sucks :(',
          style: TextStyle(fontSize: 32),
          textAlign: TextAlign.center,
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Wrap(
        spacing: 20,
        runSpacing: 15,
        children: List.from(
          likedUsers.map(
            (e) => _profileTile(e, context),
          ),
        ),
      ),
    );
  }
}
