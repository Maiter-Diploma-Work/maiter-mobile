import 'package:amica/src/models/chat_message.dart';
import 'package:amica/src/screens/chat/message-input/message_input.dart';
import 'package:amica/src/screens/chat/message/message.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_round_icon_button.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  final List<ChatMessage> _chatMessages = [
    ChatMessage(id: 1, userId: 2, text: 'Привіт))'),
    ChatMessage(
      id: 2,
      userId: 2,
      text: 'Якщо ти таки прийдеш, то підходь до кінотеатру',
    ),
    ChatMessage(id: 3, userId: 1, text: 'Добре)'),
  ];

  @override
  void initState() {
    //TODO: Fetch Messages from backend
    super.initState();
  }

  void _onDrag(DragUpdateDetails details, BuildContext context) {
    int sensitivity = 8;
    if (details.delta.dx > sensitivity) {
      // Right Swipe
      // debugPrint('Right Swipe, $sensitivity');
      context.go('/chat-list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) => _onDrag(details, context),
      child: Container(
        color: Theme.of(context).colorScheme.inverseSurface,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              shrinkWrap: true,
              children: List.from(
                _chatMessages.map(
                  (e) => generateMessage(context, e),
                ),
              ),
            ),
            MessageInput(control: TextEditingController()),
          ],
        ),
      ),
    );
  }

  Widget generateMessage(BuildContext context, ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 11),
      child: Wrap(
        children: [
          AmicaChatMessage(message: message, userId: widget.userId),
        ],
      ),
    );
  }
}
