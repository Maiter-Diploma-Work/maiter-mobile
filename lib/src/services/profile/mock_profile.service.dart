import 'package:amica/src/data/valery_doe.dart';
import 'package:amica/src/models/DTO/User/edit_user_dto.dart';
import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:amica/src/models/profiles/expectancies.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/profile/profile.service.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MockProfileService extends ProfileService {
  static MockProfileService? _instance;

  static MockProfileService get instance {
    _instance ??= MockProfileService();
    _instance!.userProfile ??= ValeryDoe;

    return _instance!;
  }

  void _initialiseCharacterTraits(List<CharacterTrait> characterTraits) {
    FormArray<CharacterTrait> traits =
        profileEditForm.control('characterTraits') as FormArray<CharacterTrait>;

    traits.clear();
    for (CharacterTrait trait in characterTraits) {
      traits.add(FormControl<CharacterTrait>(value: trait));
    }
  }

  void _initialiseExpectations(List<Expectancy> expectancies) {
    FormArray<String> expectations =
        profileEditForm.control('expectations') as FormArray<String>;

    expectations.clear();
    for (Expectancy expectation in expectancies) {
      expectations.add(FormControl<String>(value: expectation.text));
    }
  }

  @override
  void setUserProfile(UserProfile profile) {
    //* this should be an API call in normal service
    userProfile = profile;
  }

  @override
  void setEditForm(UserProfile profile) {
    for (String element in profileEditForm.controls.keys) {
      if (element == 'goals') {
        FormGroup goals = profileEditForm.control(element) as FormGroup;
        for (var goal in goals.controls.entries) {
          goal.value.value = profile.goals?[goal.key];
        }
      } else if (element == 'expectations') {
        _initialiseExpectations(profile.expectancies);
      } else if (element == 'characterTraits') {
        _initialiseCharacterTraits(profile.characterTraits);
      } else {
        profileEditForm.control(element).value = profile.toMap()[element];
      }
    }
  }

  @override
  Future<void> deleteUser(String id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(String id, EditUserDto newUser) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
