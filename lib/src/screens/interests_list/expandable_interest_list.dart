import 'package:amica/src/models/shared/interest.dart';
import 'package:amica/src/models/shared/interest_list.dart';
import 'package:amica/src/shared/inputs/amica_round_icon_button.dart';
import 'package:amica/src/shared/interest_view.dart';
import 'package:flutter/material.dart';

typedef OnInterestTap = void Function(Interest interest);

class ExpandableInterestList extends StatefulWidget {
  final InterestList interestList;
  final List<Interest> selectedInterests;
  final OnInterestTap? interestTap;

  const ExpandableInterestList({
    super.key,
    required this.interestList,
    required this.selectedInterests,
    this.interestTap,
  });

  @override
  State<ExpandableInterestList> createState() => _ExpandableInterestListState();
}

class _ExpandableInterestListState extends State<ExpandableInterestList> {
  bool _isExpanded = true;

  List<Widget> _expandedListChildren() {
    if (_isExpanded == true) {
      return List.from(widget.interestList.interests.map(
        (e) => InterestView(
          interest: e,
          constraints: BoxConstraints(
            minWidth: (MediaQuery.of(context).size.width - 64) * 0.45,
          ),
          onTap: widget.interestTap,
          color: interestSelected(e),
        ),
      ));
    }

    return [];
  }

  void _toggleList() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  Color? interestSelected(Interest interest) {
    final List<String> interests =
        widget.selectedInterests.map((e) => e.name).toList();
    return interests.contains(interest.name) == true
        ? Theme.of(context).colorScheme.secondary
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: _toggleList,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.interestList.groupName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AmicaRoundIconButton(
                onTap: _toggleList,
                icon: Icon(
                  _isExpanded == true
                      ? Icons.arrow_drop_down
                      : Icons.arrow_drop_up,
                ),
              ),
            ],
          ),
        ),
        Wrap(
          spacing: 20,
          runSpacing: 10,
          alignment: WrapAlignment.spaceEvenly,
          children: _expandedListChildren(),
        ),
      ],
    );
  }
}
