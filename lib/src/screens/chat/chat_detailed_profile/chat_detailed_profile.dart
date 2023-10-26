import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/inputs/amica_round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ChatDetailedProfileView extends StatefulWidget {
  final String userId;
  const ChatDetailedProfileView({super.key, required this.userId});

  @override
  State<ChatDetailedProfileView> createState() =>
      _ChatDetailedProfileViewState();
}

class _ChatDetailedProfileViewState extends State<ChatDetailedProfileView> {
  UserProfile? _user;

  Future<void> readMockUserFromJson() async {
    final int userId = int.parse(widget.userId);
    final String response =
        await rootBundle.loadString('assets/mock_users.json');
    final List<UserProfile> data = usersFromJson(response);
    setState(() {
      _user = data.firstWhere((element) => element.id == userId);
    });
  }

  void _onHorizontalSwipe(DragUpdateDetails details, BuildContext context) {
    int sensitivity = 8;
    if (details.delta.dx < -sensitivity) {
      context.go('chat/${widget.userId}');
    }
  }

  @override
  void initState() {
    super.initState();
    readMockUserFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) => _onHorizontalSwipe(details, context),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 128, left: 64, right: 64),
        child: Column(
          children: [
            _getAvatarAndName(context),
            const Gap(verticalGap: 16, horizontalGap: 0),
            Container(
              padding: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _getActions(),
                  const Gap(verticalGap: 64, horizontalGap: 0),
                  AmicaButton(
                    onPressed: () {},
                    text: "Block user",
                    color: Theme.of(context).colorScheme.error,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AmicaRoundIconButton.labeled(
          "profile",
          icon: const Icon(Icons.person),
          onTap: () {},
        ),
        AmicaRoundIconButton.labeled(
          "mute",
          icon: const Icon(Icons.notifications_off_outlined),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _getAvatarAndName(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 41,
          backgroundImage: AssetImage(_user == null ? '' : _user!.photo),
        ),
        const Gap(verticalGap: 0, horizontalGap: 16),
        Column(
          children: [
            Text(
              _user == null ? '' : _user!.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              _user == null ? '' : _user!.tag,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
