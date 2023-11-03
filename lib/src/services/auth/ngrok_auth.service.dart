import 'dart:convert';

import 'package:amica/src/services/api_url.dart';
import 'package:amica/src/services/auth/auth.service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class NgrokAuthService extends AuthService {
  static NgrokAuthService? _instance;

  static NgrokAuthService get instance {
    _instance ??= NgrokAuthService();

    return _instance!;
  }

  bool checkForms() {
    if (personalInfoForm.valid &&
        goalForm.valid &&
        selectedInterests.length > 3) {
      return true;
    }

    return false;
  }

  @override
  Future<http.Response> fillInfo() async {
    if (!checkForms()) {
      return http.Response(
        'The forms is not valid, please fill these in appropriate way',
        403,
      );
    }

    LatLng location = personalInfoForm.control('location').value as LatLng;

    Map<String, Object?> body = {
      ...NgrokAuthService.instance.personalInfoForm.value,
      'location': [
        location.latitude,
        location.longitude,
      ],
      'birthdate': NgrokAuthService.instance.personalInfoForm
          .control('birthdate')
          .value
          .toString(),
      ...NgrokAuthService.instance.goalForm.value,
      'interests': List.from(
        NgrokAuthService.instance.selectedInterests.map((e) => e.name),
      ),
      'favoriteSong': NgrokAuthService.instance.favoriteSong.value.toString(),
    };

    http.Response response = await http.post(
      Uri.parse('$apiUrl/api/auth/registerPersonalInfo'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );

    return response;
  }

  @override
  Future<http.Response> login() async {
    if (loginForm.invalid) {
      return http.Response(
        'The forms is not valid, please fill these in appropriate way',
        403,
      );
    }

    http.Response response = await http.post(
      Uri.parse('$apiUrl/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginForm.value),
    );

    return response;
  }

  @override
  Future<http.Response> register() async {
    if (registerForm.invalid) {
      return http.Response(
        'The forms is not valid, please fill these in appropriate way',
        403,
      );
    }

    http.Response response = await http.post(
      Uri.parse('$apiUrl/api/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(registerForm.value),
    );

    return response;
  }
}
