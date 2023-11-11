import 'package:amica/src/models/chat_message.dart';
import 'package:amica/src/screens/chat/message-input/message_input.dart';
import 'package:amica/src/screens/chat/message/message.dart';
import 'package:amica/src/services/chat/message/message.service.dart';
import 'package:amica/src/services/profile/profile.service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatView extends StatefulWidget {
  final String userId;
  final MessageService messageService;
  final ProfileService profileService;
  final String chatRoomId;

  const ChatView({
    super.key,
    required this.userId,
    required this.messageService,
    required this.chatRoomId,
    required this.profileService,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  static int newMockMessageId = 31;
  List<ChatMessage> _chatMessages = [];

  Future<void> initMessages() async {
    var result = await widget.messageService.getMessagesFor(widget.chatRoomId);

    setState(() {
      _chatMessages = result;
    });
  }

  @override
  void initState() {
    super.initState();
    initMessages();
  }

  void _onDrag(DragUpdateDetails details, BuildContext context) {
    int sensitivity = 8;
    if (details.delta.dx > sensitivity) {
      context.go('/chat');
    } else if (details.delta.dx < -sensitivity) {
      context.go('/chat/${widget.userId}/detailed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) => _onDrag(details, context),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ...List.from(
                    _chatMessages.map(
                      (e) => generateMessage(context, e),
                    ),
                  ),
                ],
              ),
            ),
            MessageInput(
              control: TextEditingController(),
              messageInputSend: (value) {
                setState(() {
                  _chatMessages.add(ChatMessage(
                    id: newMockMessageId,
                    chatroomId: int.parse(widget.chatRoomId),
                    creatorId: widget.profileService.userProfile!.id,
                    content: value.trim(),
                    beenRedacted: false,
                    messageType: MessageType.plain,
                    sentAt: DateTime.now(),
                  ));
                });
              },
            ),
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
