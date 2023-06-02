import 'package:maiter/models/profiles/profile.dart';

class UserProfile extends Profile {
  int age;
  String tag;

  UserProfile({
    required super.name,
    required super.description,
    required super.id,
    required super.location,
    required super.photo,
    required super.interests,
    required this.age,
    required this.tag,
  });
}
