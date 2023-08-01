import 'dart:convert';

Expectancy expectancyFromJson(String str) =>
    Expectancy.fromJson(json.decode(str));
String expectancyToJson(Expectancy data) => json.encode(data.toJson());

List<Expectancy> expectanciesFromJson(String str) =>
    List<Expectancy>.from(json.decode(str).map((x) => Expectancy.fromJson(x)));
String expectanciesToJson(List<Expectancy> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Expectancy {
  int id;
  int userId;
  String text;

  Expectancy({
    required this.id,
    required this.userId,
    required this.text,
  });

  factory Expectancy.fromJson(Map<String, dynamic> json) => Expectancy(
        id: json["id"],
        userId: json["userId"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "text": text,
      };
}
