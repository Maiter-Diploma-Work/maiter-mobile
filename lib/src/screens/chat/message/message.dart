import 'package:amica/src/models/chat_message.dart';
import 'package:flutter/material.dart';

class AmicaChatMessage extends StatelessWidget {
  final ChatMessage message;
  final String userId;
  const AmicaChatMessage({super.key, required this.message, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Align(
          alignment: userId != message.userId.toString()
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: userId == message.userId.toString()
                  ? const Radius.circular(21)
                  : Radius.zero,
              bottomRight: userId != message.userId.toString()
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
              color: userId != message.userId.toString()
                  ? const Color(0xFFC3CCD7)
                  : Theme.of(context).colorScheme.primary,
              child: Text(
                message.text,
                style: TextStyle(
                  color: userId != message.userId.toString()
                      ? Colors.black
                      : Theme.of(context).colorScheme.onPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        );
  }
}