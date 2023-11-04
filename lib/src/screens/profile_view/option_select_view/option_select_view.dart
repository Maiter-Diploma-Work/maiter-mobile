import 'package:amica/src/screens/profile_view/option_select_view/option_select_item.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:flutter/material.dart';

import '../../../shared/gap.dart';

typedef OnOptionSelect = void Function(Object data);

class OptionSelect<T extends OptionSelectItem> extends StatelessWidget {
  final List<T> options;
  final OnOptionSelect onOptionSelect;

  const OptionSelect({
    super.key,
    required this.options,
    required this.onOptionSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 82, vertical: 42),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: List.from(options.map(
              (e) => Column(
                children: [
                  AmicaButton(
                    color: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    text: e.title,
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () => onOptionSelect(e.extraData),
                  ),
                  const Gap(verticalGap: 24, horizontalGap: 0),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
