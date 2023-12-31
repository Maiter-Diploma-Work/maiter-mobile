import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ChatAppBarTitle extends StatefulWidget {
  final String userId;
  final String chatRoomId;

  const ChatAppBarTitle({
    super.key,
    required this.userId,
    required this.chatRoomId,
  });

  @override
  State<ChatAppBarTitle> createState() => _ChatAppBarTitleState();
}

class _ChatAppBarTitleState extends State<ChatAppBarTitle> {
  UserProfile? _user;

  Future<void> readMockUserFromJson() async {
    final int userId = int.parse(widget.userId);
    final String response =
        await rootBundle.loadString('assets/mock-data/mock_users.json');
    final List<UserProfile> data = usersFromJson(response);
    setState(() {
      _user = data.firstWhere((element) => element.id == userId);
    });
  }

  @override
  void initState() {
    super.initState();
    readMockUserFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.go('/chat/${widget.userId}/${widget.chatRoomId}/detailed'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _user == null ? '' : _user!.name,
          ),
          CircleAvatar(
            // child: Image.network(_user == null ? '' : _user!.photo),
            backgroundImage: AssetImage(_user == null ? '' : _user!.photo),
          ),
        ],
      ),
    );
  }
}
