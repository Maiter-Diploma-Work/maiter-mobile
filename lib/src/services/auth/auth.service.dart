import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/models/shared/interest.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:reactive_forms/reactive_forms.dart';

abstract class AuthService {
  final registerForm = FormGroup(
    {
      'username': FormControl<String>(
        validators: [Validators.required],
      ),
      'email': FormControl<String>(
        validators: [Validators.email, Validators.required],
      ),
      'password': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
      'confirmPassword': FormControl<String>(),
    },
    validators: [
      const MustMatchValidator('password', 'confirmPassword', false),
    ],
  );

  final loginForm = FormGroup({
    'email': FormControl<String>(
      value: '',
      validators: [Validators.email, Validators.required],
    ),
    'password': FormControl<String>(
      value: '',
      validators: [Validators.required],
    ),
  });

  final FormGroup personalInfoForm = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'birthdate': FormControl<DateTime>(validators: [Validators.required]),
    'gender': FormControl<String>(
        value: UserProfile.empty().gender, validators: [Validators.required]),
    'location': FormControl<LatLng>(validators: [Validators.required]),
    'height': FormControl<int>(validators: [
      Validators.required,
      Validators.min(55),
      Validators.max(272)
    ]),
    'education': FormControl<String>(),
    'bio': FormControl<String>(validators: [Validators.required]),
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
    }, validators: [
      Validators.required,
    ]),
    'status': FormControl<String>(value: statuses[1]),
    'lookingFor': FormControl<String>(value: lookingFors[1]),
    'expectations': FormArray<String>([]),
  });

  final List<Interest> selectedInterests = [];

  final FormControl<String> favoriteSong = FormControl<String>();

  Future<http.Response> register();

  Future<http.Response> fillInfo();

  Future<http.Response> login();
}
