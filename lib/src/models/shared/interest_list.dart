import 'dart:convert';

import 'interest.dart';

List<InterestList> interestListsFromMockJson(String str) =>
    List.from(jsonDecode(str).map((e) => InterestList.fromMockJson(e)));

List<InterestList> interestListsFromJson(String str) =>
    List.from(jsonDecode(str).map((e) => InterestList.fromJson(e)));

class InterestList {
  final int id;
  final String groupName;
  final List<Interest> interests;

  InterestList({
    required this.id,
    required this.groupName,
    required this.interests,
  });

  factory InterestList.fromJson(Map<String, dynamic> json) => InterestList(
        id: json['id'],
        groupName: json["group_name"],
        interests: interestsFromJson(json['interests']),
      );

  factory InterestList.fromMockJson(Map<String, dynamic> json) {
    List<String> jsonInterests = List.from(json['interests']);
    List<Interest> interests = jsonInterests
        .map(
          (e) => Interest(
              id: jsonInterests.indexOf(e),
              profileId: -1,
              name: e,
              category: json['group_name']),
        )
        .toList();

    return InterestList(
      id: json['id'],
      groupName: json['group_name'],
      interests: interests,
    );
  }
}
