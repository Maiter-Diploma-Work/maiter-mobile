import 'dart:convert';

List<Interest> interestsFromJson(List<dynamic> str) =>
    List.from(str.map((e) => Interest.fromJson(e)));

Interest interestFromJson(String str) => Interest.fromJson(json.decode(str));

String interestToJson(Interest data) => json.encode(data.toJson());

class Interest {
  int id;
  int profileId;
  String name;
  String category;

  Interest({
    required this.id,
    required this.profileId,
    required this.name,
    required this.category,
  });

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
        id: json["id"],
        profileId: json["profileId"],
        name: json["name"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profileId": profileId,
        "name": name,
        "category": category,
      };
}
