import 'package:maiter/src/models/profiles/profile.dart';

Map<int, String> Genders = {
  1: 'Male',
  2: 'Female',
  3: 'Non-binary',
};

class UserProfile extends Profile {
  int age;
  String tag;
  String gender;
  DateTime birthDate;
  String? education;
  Map<String, String>? socialNetworks;

  UserProfile({
    required super.name,
    required super.id,
    required super.location,
    required super.photo,
    required super.interests,
    required this.age,
    required this.tag,
    required this.gender,
    required this.birthDate,
    super.description,
    this.education,
    this.socialNetworks,
  });
}
