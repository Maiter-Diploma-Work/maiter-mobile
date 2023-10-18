import 'package:amica/src/models/shared/interest.dart';
import 'package:amica/src/models/shared/interest_list.dart';
import 'package:amica/src/shared/inputs/maiter_search_bar.dart';
import 'package:amica/src/shared/interests_list/expandable_interest_list.dart';
import 'package:amica/src/shared/inputs/amica_text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InterestsListSelect extends StatefulWidget {
  final List<Interest> selectedInterests;
  final FormControl<String> favoriteSongControl;

  const InterestsListSelect({
    super.key,
    required this.selectedInterests,
    required this.favoriteSongControl,
  });

  @override
  State<InterestsListSelect> createState() => _InterestsListSelectState();
}

class _InterestsListSelectState extends State<InterestsListSelect> {
  TextEditingController controller = TextEditingController();
  late List<InterestList> _interestListsSource = [];
  List<InterestList> _interestLists = [];

  Future<void> readMockInterestsFromJson() async {
    final String response =
        await rootBundle.loadString('assets/mock_interests.json');

    setState(() {
      _interestListsSource = interestListsFromMockJson(response);
      _interestLists = _interestListsSource;
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

  void _transformInterestsList() {
    setState(() {
      _interestLists = List.from(
        _interestListsSource.map(
          (e) => InterestList(
            id: e.id,
            groupName: e.groupName,
            interests: List.from(
              e.interests
                  .where((element) => element.name.contains(controller.text)),
            ),
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    readMockInterestsFromJson();
    controller.addListener(_transformInterestsList);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
      ),
      child: ListView(
        children: [
          AmicaSearchBar(
            controller: controller,
          ),
          ...List.from(
            _interestLists.map(
              (interestList) => _interestsListGenerator(interestList),
            ),
          ),
          AmicaTextFormInput(
            fieldName: 'Favorite song',
            hintText: 'your favorite track',
            padding: const EdgeInsets.only(bottom: 64),
            controller: widget.favoriteSongControl as FormControl<String>,
          ),
        ],
      ),
    );
  }
}
