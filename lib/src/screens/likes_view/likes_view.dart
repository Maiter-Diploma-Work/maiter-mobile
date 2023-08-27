import 'package:amica/src/models/DTO/like_dto.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/inputs/amica_round_icon_button.dart';
import 'package:amica/src/shared/profile/location.dart';
import 'package:amica/src/shared/profile/profile_picture.dart';
import 'package:amica/src/shared/profile/user_profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmicaLikesView extends StatefulWidget {
  final int userId;
  const AmicaLikesView({
    super.key,
    required this.userId,
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

  void _onProfileTap(UserProfile userProfile) {
    debugPrint(' --> ${userProfile.id} was clicked');
  }

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
    // ! I know this is the worst way possible.
    // ! The logic for this feature will be released on backend,
    // ! and this method will be nothing more than fetch call

    final String likesResponse =
        await rootBundle.loadString('assets/mock_likes.json');
    final String usersResponse =
        await rootBundle.loadString('assets/mock_users.json');

    final List<LikeDto> likes = likesDtoFromJson(likesResponse);
    final List<UserProfile> users = usersFromJson(usersResponse);

    List<UserProfile> result = [];

    for (var like in likes) {
      if (like.firstUserId == widget.userId) {
        result = [
          ...result,
          users.firstWhere((element) => element.id == like.secondUserId),
        ];
      }
    }

    setState(() {
      likedUsers = result;
    });
  }

  @override
  void initState() {
    // TODO: implement initState to fetch likes
    super.initState();
    readMockLikesFromJson();
  }

  @override
  Widget build(BuildContext context) {
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
