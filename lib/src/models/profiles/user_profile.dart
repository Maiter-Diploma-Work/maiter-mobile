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

class UserProfile extends Profile {
  late int age;
  late String tag;
  late DateTime birthDate;
  late List<Expectancy> expectancies;
  late List<CharacterTrait> characterTraits;
  late String gender;
  late String? education;
  late String? favoriteSong;
  late int? height;
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
    required this.characterTraits,
    required this.expectancies,
    this.height,
    this.favoriteSong,
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
        height: json['height'],
        characterTraits: characterTraitsFromJson(json['characterTraits']),
        expectancies: expectanciesFromJson(json['expectancies']),
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
    data['characterTraits'] = characterTraitsToJson(characterTraits);
    data['expectancies'] = expectanciesToJson(expectancies);

    return data;
  }
}
