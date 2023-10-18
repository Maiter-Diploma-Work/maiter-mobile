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

Map<String, bool> goals = {
  'love': false,
  'friends': false,
  'adventures': false,
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
  late Map<String, bool>? goals;

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
    this.goals,
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
        goals: json['goals'],
      );

  factory UserProfile.empty() => UserProfile(
        id: -1,
        name: '',
        location: Location(
          name: '',
          id: -1,
          countryName: '',
          longitude: 0.0,
          latitude: 0.0,
        ),
        photo: '',
        interests: [],
        tag: '',
        gender: genders.values.first,
        lookingFor: lookingFors.values.last,
        status: statuses.values.first,
        birthDate: DateTime.now(),
        characterTraits: [
          CharacterTrait(
            id: -1,
            userId: -1,
            bottomName: 'Introvert',
            topName: 'Extravert',
            degree: 0,
          ),
          CharacterTrait(
            id: -1,
            userId: -1,
            bottomName: 'Analytical',
            topName: 'Creative',
            degree: 0,
          ),
          CharacterTrait(
            id: -1,
            userId: -1,
            bottomName: 'Busy',
            topName: 'Time Rich',
            degree: 0,
          ),
          CharacterTrait(
            id: -1,
            userId: -1,
            bottomName: 'Messy',
            topName: 'Organized',
            degree: 0,
          ),
          CharacterTrait(
            id: -1,
            userId: -1,
            bottomName: 'Independent',
            topName: 'Team Player',
            degree: 0,
          ),
          CharacterTrait(
            id: -1,
            userId: -1,
            bottomName: 'Passive',
            topName: 'Active',
            degree: 0,
          ),
          CharacterTrait(
            id: -1,
            userId: -1,
            bottomName: 'Safe',
            topName: 'Risky',
            degree: 0,
          ),
        ],
        expectancies: [],
        goals: {
          'love': false,
          'friends': false,
          'adventures': false,
        },
      );

  Map<String, dynamic> toJson() {
    return toMap();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tag': tag,
      'name': name,
      'gender': gender,
      'birthDate': birthDate,
      'education': education,
      'description': description,
      'status': status,
      'lookingFor': lookingFor,
      'photo': photo,
      'photos': photos,
      'interests': List.from(interests.map((e) => e.toJson())),
      'socialNetworks':
          socialNetworks ?? List.from(socialNetworks!.map((e) => e.toJson())),
      'characterTraits': characterTraitsToJson(characterTraits),
      'expectancies': expectanciesToJson(expectancies),
      'goals': goals,
    };
  }
}
