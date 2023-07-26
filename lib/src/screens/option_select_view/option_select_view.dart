import 'package:flutter/material.dart';
import 'package:maiter/src/screens/option_select_view/option_select_item.dart';
import 'package:maiter/src/screens/profile_view/link_button.dart';
import 'package:maiter/src/shared/gap.dart';
import 'package:maiter/src/shared/inputs/maiter_button.dart';

class OptionSelect<T extends OptionSelectItem> extends StatefulWidget {
  final List<T> options;
  const OptionSelect({
    super.key,
    required this.options,
  });

  @override
  State<OptionSelect> createState() => _OptionSelectState<T>();
}

class _OptionSelectState<T extends OptionSelectItem>
    extends State<OptionSelect<T>> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 82, vertical: 42),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
              widget.options.length,
              (index) => Column(
                children: [
                  MaiterButton(
                    color: Theme.of(context).colorScheme.primary,
                    text: widget.options.elementAt(index).title,
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {},
                  ),
                  const Gap(verticalGap: 24, horizontalGap: 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
