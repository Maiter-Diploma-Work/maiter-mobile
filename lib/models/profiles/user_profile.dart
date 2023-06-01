import 'package:maiter/models/profiles/profile.dart';

class UserProfile extends Profile {
  int age;

  UserProfile(super.name, 
              super.profileDescription, 
              super.id, 
              super.location,
              super.photo, 
              this.age);
}
