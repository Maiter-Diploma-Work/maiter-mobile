import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:maiter/src/models/profiles/profile.dart';
import 'package:maiter/src/models/shared/interest.dart';
import 'package:maiter/src/models/shared/location.dart';
import 'package:maiter/src/models/shared/social_network.dart';

List<UserProfile> usersFromJson(String str) =>
    List<UserProfile>.from(json.decode(str).map(
          (x) => UserProfile.fromJson(x),
        ));

UserProfile userFromJson(String str) => UserProfile.fromJson(json.decode(str));

Map<int, String> Genders = {
  1: 'Male',
  2: 'Female',
  3: 'Non-binary',
};

class UserProfile extends Profile {
  late int age;
  late String tag;
  late String gender;
  late DateTime birthDate;
  late String? education;
  late List<SocialNetwork>? socialNetworks;

  UserProfile({
    required super.id,
    required super.name,
    super.description,
    required super.location,
    required super.photo,
    required super.interests,
    required this.age,
    required this.tag,
    required this.gender,
    required this.birthDate,
    this.education,
    this.socialNetworks,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        location: Location.fromJson(json['location']),
        photo: json['photo'],
        interests: interestsFromJson(json['interests']),
        age: json['age'],
        tag: json['tag'],
        gender: json['gender'],
        birthDate: DateFormat.yMd().parse(json['birthDate']),
        education: json['education'],
        socialNetworks: socialNetworksFromJson(json['socialNetworks']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['age'] = age;
    data['tag'] = tag;
    data['name'] = name;
    data['gender'] = gender;
    data['birthDate'] = birthDate;
    data['education'] = education;
    data['description'] = description;
    data['location'] = location.toJson();
    data['photo'] = photo;
    data['interests'] = List.generate(
      interests.length,
      (index) => interests[index].toJson(),
    );
    data['socialNetworks'] = socialNetworks == null
        ? null
        : List.generate(
            socialNetworks!.length,
            (index) => socialNetworks![index].toJson(),
          );

    return data;
  }
}
