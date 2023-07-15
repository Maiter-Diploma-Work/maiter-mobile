import 'package:maiter/src/models/profiles/profile.dart';

class UserProfile extends Profile {
  int age;
  String tag;
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
    super.description,
    this.education,
    this.socialNetworks,
  });
}
