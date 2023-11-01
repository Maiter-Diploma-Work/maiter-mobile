import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/models/shared/interest.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class RegisterService {
  final FormGroup personalInfoForm = FormGroup({
    'name': FormControl<String>(),
    'birthdate': FormControl<DateTime>(),
    'gender': FormControl<String>(value: UserProfile.empty().gender),
    'location': FormControl<String>(),
    'height': FormControl<int>(),
    'education': FormControl<String>(),
    'bio': FormControl<String>(),
    'characterTraits': FormArray<CharacterTrait>(
      List.from(
        UserProfile.empty().characterTraits.map(
              (e) => FormControl<CharacterTrait>(value: e),
            ),
      ),
    ),
  });

  final FormGroup goalForm = FormGroup({
    'goals': FormGroup({
      'friends': FormControl<bool>(value: false),
      'love': FormControl<bool>(value: false),
      'adventure': FormControl<bool>(value: false),
    }),
    'status': FormControl<String>(value: statuses[1]),
    'lookingFor': FormControl<String>(value: lookingFors[1]),
    'expectations': FormArray<String>([]),
  });

  final List<Interest> selectedInterests = [];

  final FormControl<String> favoriteSong = FormControl<String>();

  Future<void> register();
}
