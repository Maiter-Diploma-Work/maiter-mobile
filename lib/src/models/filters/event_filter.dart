import 'dart:convert';

import 'package:amica/src/models/filters/filter.dart';
import 'package:amica/src/models/filters/range.dart';

List<EventFilter> eventFiltersFromJson(String str) => List<EventFilter>.from(
    json.decode(str).map((x) => EventFilter.fromJson(x)));

String eventFiltersToJson(List<EventFilter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

EventFilter eventFilterFromJson(String str) =>
    EventFilter.fromJson(json.decode(str));

String eventFilterToJson(EventFilter data) => json.encode(data.toJson());

class EventFilter extends Filter {
  EventFilter({
    required super.id,
    required super.userId,
    required super.distance,
    required super.age,
    required super.lookingFor,
  });

  factory EventFilter.fromJson(Map<String, dynamic> json) => EventFilter(
        id: json["id"],
        userId: json["userId"],
        distance: json["distance"],
        age: Range.fromJson(json["age"]),
        lookingFor: json["lookingFor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "distance": distance,
        "age": age.toJson(),
        "lookingFor": lookingFor,
      };
}
