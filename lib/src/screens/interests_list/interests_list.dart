import 'package:amica/src/models/shared/interest.dart';
import 'package:amica/src/models/shared/interest_list.dart';
import 'package:amica/src/screens/chat/maiter_search_bar.dart';
import 'package:amica/src/screens/interests_list/expandable_interest_list.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InterestsListSelect extends StatefulWidget {
  final bool isRegistrations;
  final List<Interest> selectedInterests;

  const InterestsListSelect({
    super.key,
    required this.selectedInterests,
    required this.isRegistrations,
  });

  @override
  State<InterestsListSelect> createState() => _InterestsListSelectState();
}

class _InterestsListSelectState extends State<InterestsListSelect> {
  List<InterestList> _interestList = [];

  Future<void> readMockInterestsFromJson() async {
    final String response =
        await rootBundle.loadString('assets/mock_interests.json');

    setState(() {
      _interestList = interestListsFromMockJson(response);
    });
  }

  void _toggleInterest(Interest interest) {
    final List<String> interests =
        widget.selectedInterests.map((e) => e.name).toList();

    setState(() {
      if (!interests.contains(interest.name)) {
        widget.selectedInterests.add(interest);
      } else {
        widget.selectedInterests.removeWhere(
          (element) => element.name == interest.name,
        );
      }
    });
  }

  Widget _interestsListGenerator(InterestList interestList) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: ExpandableInterestList(
            interestList: interestList,
            selectedInterests: widget.selectedInterests,
            interestTap: _toggleInterest,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    readMockInterestsFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        bottom: 64,
        top: 32,
      ),
      child: ListView(
        children: [
          const AmicaSearchBar(),
          ...List.from(
            _interestList.map(
              (interestList) => _interestsListGenerator(interestList),
            ),
          ),
          const AmicaTextFormInput(
            fieldName: 'Favorite song',
            hintText: 'your favorite track',
          ),
        ],
      ),
    );
  }
}
