import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/models/shared/interest.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:reactive_forms/reactive_forms.dart';

abstract class AuthService {
  final FormGroup personalInfoForm = FormGroup({
    'name': FormControl<String>(),
    'birthdate': FormControl<DateTime>(),
    'gender': FormControl<String>(value: UserProfile.empty().gender),
    'location': FormControl<LatLng>(),
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

  Future<http.Response> register();

  Future<http.Response> login();
}
