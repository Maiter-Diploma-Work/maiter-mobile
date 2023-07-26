import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  final String userId;
  const ChatView({
    super.key,
    required this.userId,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.userId),
    );
  }
}
