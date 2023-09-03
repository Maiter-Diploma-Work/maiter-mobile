import 'dart:convert';

import 'package:amica/src/models/profiles/profile.dart';
import 'package:amica/src/models/shared/interest.dart';
import 'package:amica/src/models/shared/location.dart';
import 'package:intl/intl.dart';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

List<Event> eventsFromJson(String str) => List<Event>.from(
      json.decode(str).map((x) => Event.fromJson(x)),
    );

String eventsToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event extends Profile {
  final int creatorId;
  final int amountOfPeople;
  final int maxAge;
  final int minAge;
  final double radius;
  final String lookingFor;
  final DateTime creationDate;

  Event({
    required this.creatorId,
    required this.creationDate,
    required this.amountOfPeople,
    required this.lookingFor,
    required this.minAge,
    required this.maxAge,
    required this.radius,
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
        amountOfPeople: json['amount_of_people'],
        lookingFor: json['looking_for'],
        maxAge: json['age_constraints']['max_age'],
        minAge: json['age_constraints']['min_age'],
        radius: json['radius'],
        creationDate: DateFormat.yMd().parse(json["creation_date"]),
        photo: json['creator_photo'],
        location: Location.fromJson(json["location"]),
        description: json["description"],
        name: json['name'],
        interests: List<Interest>.from(json['interests']),
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
