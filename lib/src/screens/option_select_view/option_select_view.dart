import 'package:amica/src/screens/option_select_view/option_select_item.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:flutter/material.dart';

import '../../shared/gap.dart';

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
                  AmicaButton(
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
