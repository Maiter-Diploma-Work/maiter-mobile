import 'package:amica/src/models/profiles/profile.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/screens/chat/maiter_search_bar.dart';
import 'package:amica/src/shared/delimeter.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ChatListView extends StatefulWidget {
  final List<Profile> chats;

  const ChatListView({super.key, required this.chats});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  List<UserProfile> _users = [];

  final int _maximumQuickChats = 4;

  Future<void> readMockUsersFromJson() async {
    final String response =
        await rootBundle.loadString('assets/mock_users.json');
    final List<UserProfile> data = usersFromJson(response);
    setState(() {
      _users = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readMockUsersFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AmicaSearchBar(),
        _generateChatList(context),
      ],
    );
  }

  Widget _generateChatList(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(48),
        topRight: Radius.circular(48),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height - 188,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 19),
        color: Theme.of(context).colorScheme.inverseSurface,
        child: ListView(
          children: [
            _generateQuickChats(context),
            const Gap(verticalGap: 33.0, horizontalGap: 0),
            ..._generateContacts(context),
          ],
        ),
      ),
    );
  }

  Padding _generateQuickChats(BuildContext context) {
    //TODO: horizontal scrolling
    List<UserProfile> users = [];
    if (_users.isNotEmpty) {
      users = List.generate(
        _users.length < 5 ? _users.length : 4,
        (index) => _users[index],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _addQuickChatButton(context),
          ...List<Widget>.from(
            users.map(
              (e) => CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).colorScheme.background,
                backgroundImage: AssetImage(e.photo),
                // child: Image.network(e.photo),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _generateContacts(BuildContext context) {
    return List<Widget>.from(
      _users.map(
        (e) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: generateContact(e, context),
            ),
            const Gap(verticalGap: 21.0, horizontalGap: 0)
          ],
        ),
      ),
    );
  }

  Widget _addQuickChatButton(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Circle,
      // padding: const EdgeInsets.all(13),
      strokeWidth: 1.0,
      color: Theme.of(context).colorScheme.onInverseSurface,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.primary,
          size: 24,
        ),
      ),
    );
  }

  Widget generateContact(UserProfile profile, BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/chat-list/${profile.id}'),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).colorScheme.background,
            backgroundImage: AssetImage(profile.photo),
            // child: Image.network(profile.photo),
          ),
          const Gap.cubic(16),
          generateContactName(profile, context),
        ],
      ),
    );
  }

  Widget generateContactName(UserProfile profile, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          profile.name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        Text(
          '...The last message that been sent by this user',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ],
    );
  }
}
