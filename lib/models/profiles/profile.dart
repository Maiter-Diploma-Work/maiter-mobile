import 'package:maiter/models/shared/location.dart';
import 'package:maiter/models/shared/interest.dart';

abstract class Profile {
  int id;
  String name;
  String description;
  String photo;
  Location location;
  List<Interest> interests;

  Profile(
      {required this.name,
      required this.description,
      required this.id,
      required this.location,
      required this.photo,
      required this.interests});
}
