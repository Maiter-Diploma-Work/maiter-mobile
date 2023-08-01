import 'package:amica/src/models/profiles/profile.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/screens/chat/maiter_search_bar.dart';
import 'package:amica/src/shared/delimeter.dart';
import 'package:amica/src/shared/gap.dart';
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
    return ListView(
      children: [
        const AmicaSearchBar(),
        ...generateContacts(context),
      ],
    );
  }

  List<Widget> generateContacts(BuildContext context) {
    return List<Widget>.generate(
      _users.length,
      (index) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8,
            ),
            child: generateContact(index, context),
          ),
          const Delimeter(),
        ],
      ),
    );
  }

  Widget generateContact(int index, BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/chat-list/${_users[index].id}'),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Image.network(_users[index].photo),
          ),
          const Gap.cubic(16),
          generateContactName(index, context),
        ],
      ),
    );
  }

  Widget generateContactName(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _users[index].name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        Text(
          '...The last message that been sent by this user',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}
