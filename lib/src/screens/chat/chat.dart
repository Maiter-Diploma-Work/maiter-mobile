import 'package:amica/src/models/chat_message.dart';
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
    // TODO: implement initState
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
        child: ListView(
          children: List.from(
            _chatMessages.map(
              (e) => generateMessage(context, e),
            ),
          ),
        ),
      ),
    );
  }

  Widget generateMessage(BuildContext context, ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 11),
      child: Wrap(
        children: [
          Align(
            alignment: widget.userId != message.userId.toString()
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: widget.userId == message.userId.toString()
                    ? const Radius.circular(21)
                    : Radius.zero,
                bottomRight: widget.userId != message.userId.toString()
                    ? const Radius.circular(21)
                    : Radius.zero,
                topRight: const Radius.circular(21),
                topLeft: const Radius.circular(21),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 9,
                ),
                constraints: const BoxConstraints(maxWidth: 204.0),
                color: widget.userId != message.userId.toString()
                    ? const Color(0xFFC3CCD7)
                    : Theme.of(context).colorScheme.primary,
                child: Text(
                  message.text,
                  style: TextStyle(
                    color: widget.userId != message.userId.toString()
                        ? Colors.black
                        : Theme.of(context).colorScheme.onPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
