import 'dart:convert';

import 'package:amica/src/models/filters/age_range.dart';
import 'package:amica/src/models/filters/filter.dart';
import 'package:amica/src/models/shared/interest.dart';

List<UserFilter> userFiltersFromJson(String str) =>
    List<UserFilter>.from(json.decode(str).map((x) => UserFilter.fromJson(x)));

String userFiltersToJson(List<UserFilter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

UserFilter userFilterFromJson(String str) =>
    UserFilter.fromJson(json.decode(str));

String userFilterToJson(UserFilter data) => json.encode(data.toJson());

class UserFilter extends Filter {
  late List<String> interests;

  UserFilter({
    required super.id,
    required super.userId,
    required super.distance,
    required super.age,
    required super.lookingFor,
    required this.interests,
  });

  factory UserFilter.fromJson(Map<String, dynamic> json) => UserFilter(
        id: json["id"],
        userId: json["userId"],
        distance: json["distance"],
        age: AgeRange.fromJson(json["age"]),
        lookingFor: json["lookingFor"],
        interests: List<String>.from((json['interests'] as List<dynamic>).map(
          (e) => e.toString(),
        )),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "distance": distance,
        "age": age.toJson(),
        "lookingFor": lookingFor,
        "interests": interests,
      };
}
