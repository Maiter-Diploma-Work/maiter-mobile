import 'package:amica/src/shared/inputs/amica_round_icon_button.dart';
import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController control;
  const MessageInput({super.key, required this.control});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.background,
            width: 1,
          ),
        ),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          AmicaRoundIconButton(
            icon: const Icon(Icons.attach_file),
            onTap: () {},
          ),
          TextFormField(
            autocorrect: true,
            autofocus: true,
            minLines: 1,
            maxLines: 10,
            controller: control,
            style: TextStyle(color: Theme.of(context).colorScheme.background),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              constraints: BoxConstraints(maxWidth: 295),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          AmicaRoundIconButton(
            icon: const Icon(Icons.send),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
