import 'dart:convert';

import 'package:amica/src/models/profiles/profile.dart';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

List<Event> eventsFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventsToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event extends Profile {
  int creatorId;
  DateTime creationDate;

  Event({
    required this.creatorId,
    required this.creationDate,
    required super.id,
    required super.location,
    required super.description,
    required super.name,
    required super.photo,
    required super.interests,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        creatorId: json["creator_id"],
        creationDate: json["creation_date"],
        photo: json['creator_photo'],
        location: json["location"],
        description: json["description"],
        name: json['name'],
        interests: json['interests'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "creator_id": creatorId,
        "creation_date": creationDate,
        "creator_photo": photo,
        "location": location,
        "description": description,
        "name": name,
        "interests": interests,
      };
}
