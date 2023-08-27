import 'dart:convert';

import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:amica/src/models/profiles/expectancies.dart';
import 'package:amica/src/models/shared/interest.dart';
import 'package:amica/src/models/shared/location.dart';
import 'package:amica/src/models/shared/social_network.dart';
import 'package:intl/intl.dart';

import 'profile.dart';

List<UserProfile> usersFromJson(String str) =>
    List<UserProfile>.from(json.decode(str).map(
          (x) => UserProfile.fromJson(x),
        ));

UserProfile userFromJson(String str) => UserProfile.fromJson(json.decode(str));

Map<int, String> genders = {
  1: 'Male',
  2: 'Female',
  3: 'Non-binary',
};

Map<int, String> lookingFors = {
  1: 'Male',
  2: 'Female',
  3: 'Non-binary',
  4: 'Anyone',
};

Map<int, String> statuses = {
  1: 'Free',
  2: 'Have relationship',
  3: 'Free relationship',
};

class UserProfile extends Profile {
  late String tag;
  late DateTime birthDate;
  late List<Expectancy> expectancies;
  late List<CharacterTrait> characterTraits;
  late String gender;
  late String status;
  late String lookingFor;
  late String? education;
  late String? favoriteSong;
  late int? height;
  late List<SocialNetwork>? socialNetworks;
  late List<String>? photos;

  UserProfile({
    required super.id,
    required super.name,
    super.description,
    required super.location,
    required super.photo,
    required super.interests,
    required this.tag,
    required this.gender,
    required this.lookingFor,
    required this.status,
    required this.birthDate,
    required this.characterTraits,
    required this.expectancies,
    this.height,
    this.favoriteSong,
    this.education,
    this.socialNetworks,
    this.photos,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        location: Location.fromJson(json['location']),
        photo: json['photo'],
        interests: interestsFromJson(json['interests']),
        tag: json['tag'],
        gender: json['gender'],
        birthDate: DateFormat.yMd().parse(json['birthDate']),
        education: json['education'],
        socialNetworks: socialNetworksFromJson(json['socialNetworks']),
        height: json['height'],
        characterTraits: characterTraitsFromJson(json['characterTraits']),
        expectancies: expectanciesFromJson(json['expectancies']),
        status: json['status'],
        lookingFor: json['lookingFor'],
        photos: List<String>.from(json['photos']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tag'] = tag;
    data['name'] = name;
    data['gender'] = gender;
    data['birthDate'] = birthDate;
    data['education'] = education;
    data['description'] = description;
    data['status'] = status;
    data['lookingFor'] = lookingFor;
    data['location'] = location.toJson();
    data['photo'] = photo;
    data['photos'] = photos;
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
    data['characterTraits'] = characterTraitsToJson(characterTraits);
    data['expectancies'] = expectanciesToJson(expectancies);

    return data;
  }
}
