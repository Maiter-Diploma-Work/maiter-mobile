import 'dart:convert';

CharacterTrait characterTraitFromJson(String str) =>
    CharacterTrait.fromJson(json.decode(str));

String characterTraitToJson(CharacterTrait data) => json.encode(data.toJson());

List<CharacterTrait> characterTraitsFromJson(String str) =>
    List<CharacterTrait>.from(
        json.decode(str).map((x) => CharacterTrait.fromJson(x)));

String characterTraitsToJson(List<CharacterTrait> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CharacterTrait {
  int id;
  int userId;
  String bottomName;
  String topName;
  double degree;

  CharacterTrait({
    required this.id,
    required this.userId,
    required this.bottomName,
    required this.topName,
    required this.degree,
  });

  factory CharacterTrait.fromJson(Map<String, dynamic> json) => CharacterTrait(
        id: json["id"],
        userId: json["userId"],
        bottomName: json["bottomName"],
        topName: json["topName"],
        degree: json["degree"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "bottomName": bottomName,
        "topName": bottomName,
        "degree": degree,
      };
}
