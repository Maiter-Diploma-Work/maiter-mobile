import 'package:maiter/models/location.dart';

abstract class Profile {
  int id;
  String name;
  String description;
  String photo;
  Location location;

  Profile(this.name, this.description, this.id, this.location, this.photo);
}
