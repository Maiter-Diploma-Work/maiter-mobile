import 'package:amica/src/models/DTO/User/edit_user_dto.dart';
import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class ProfileService {
  final FormGroup profileEditForm = FormGroup({
    'name': FormControl<String>(),
    'birthDate': FormControl<DateTime>(),
    'gender': FormControl<String>(),
    'status': FormControl<String>(),
    'lookingFor': FormControl<String>(),
    'education': FormControl<String>(),
    'goals': FormGroup({
      'love': FormControl<bool>(),
      'friends': FormControl<bool>(),
      'adventures': FormControl<bool>(),
    }),
    'description': FormControl<String>(),
    'expectations': FormArray<String>([]),
    'characterTraits': FormArray<CharacterTrait>([]),
  });

  UserProfile? userProfile;

  void setEditForm(UserProfile profile);

  void setUserProfile(UserProfile profile);

  //Put
  Future<void> updateUser(String id, EditUserDto newUser);

  //Delete
  Future<void> deleteUser(String id);
}
