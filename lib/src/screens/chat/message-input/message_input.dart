import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_round_icon_button.dart';
import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final TextEditingController control;
  const MessageInput({super.key, required this.control});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 256,
            height: 1,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          const Gap(verticalGap: 8, horizontalGap: 0),
          TextFormField(
            autocorrect: true,
            minLines: 1,
            maxLines: 10,
            controller: control,
            style: TextStyle(color: Theme.of(context).colorScheme.surface),
            decoration: InputDecoration(
              hintText: 'Your message goes here',
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.surface.withAlpha(137),
              ),
              filled: true,
              fillColor: Theme.of(context)
                  .colorScheme
                  .inverseSurface
                  .withOpacity(0.80),
              contentPadding: const EdgeInsets.symmetric(horizontal: 6),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AmicaRoundIconButton(
                  icon: const Icon(Icons.attach_file),
                  onTap: () {},
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AmicaRoundIconButton(
                  icon: const Icon(Icons.send),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
