import '../shared/interest.dart';
import '../shared/location.dart';

abstract class Profile {
  int id;
  String name;
  String? description;
  String photo;
  Location location;
  List<Interest> interests;

  Profile({
    required this.name,
    required this.id,
    required this.location,
    required this.photo,
    required this.interests,
    this.description,
  });
}
