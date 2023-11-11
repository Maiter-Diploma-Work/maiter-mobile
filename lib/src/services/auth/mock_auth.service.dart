import 'dart:convert';

import 'package:amica/src/models/profiles/expectancies.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/auth/auth.service.dart';
import 'package:amica/src/services/profile/mock_profile.service.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class MockLogin {
  final String email;
  final String password;
  final int userId;

  MockLogin({
    required this.email,
    required this.password,
    required this.userId,
  });

  factory MockLogin.fromJson(Map<String, dynamic> json) => MockLogin(
        email: json['email'],
        password: json['password'],
        userId: json['userId'],
      );
}

class MockAuthService extends AuthService {
  static MockAuthService? _instance;

  static MockAuthService get instance {
    _instance ??= MockAuthService();

    return _instance!;
  }

  @override
  Future<http.Response> register() async {
    String response =
        await rootBundle.loadString('assets/mock-data/mock_logins.json');
    List<MockLogin> logins = List.from(
      json.decode(response).map(
            (element) => MockLogin.fromJson(element),
          ),
    );

    if (!logins.any((x) => x.email == registerForm.control('email').value)) {
      return Future.delayed(
        const Duration(milliseconds: 250),
        () => http.Response(
          '',
          403,
        ),
      );
    }
    MockProfileService.instance.setUserProfile(UserProfile.empty());
    String tag = registerForm.control('username').value;
    MockProfileService.instance.userProfile!.tag = '@$tag';

    return Future.delayed(
      const Duration(milliseconds: 250),
      () => http.Response(
        '',
        200,
      ),
    );
  }

  @override
  Future<http.Response> fillInfo() async {
    if (personalInfoForm.invalid ||
        goalForm.invalid ||
        MockAuthService.instance.selectedInterests.length < 3) {
      return Future.delayed(
        const Duration(milliseconds: 250),
        () => http.Response(
          '',
          403,
        ),
      );
    }

    var profile = MockProfileService.instance.userProfile!;

    profile.name = personalInfoForm.control('name').value;
    profile.birthDate = personalInfoForm.control('birthDate').value;
    profile.gender = personalInfoForm.control('gender').value;
    profile.location.latitude =
        personalInfoForm.control('location').value.latitude;
    profile.location.longitude =
        personalInfoForm.control('location').value.longitude;
    profile.height = personalInfoForm.control('height').value;
    profile.education = personalInfoForm.control('education').value;
    profile.description = personalInfoForm.control('bio').value;
    profile.characterTraits = personalInfoForm.control('characterTraits').value;

    profile.goals = goalForm.control('goals').value;
    profile.status = goalForm.control('status').value;
    profile.lookingFor = goalForm.control('lookingFor').value;

    List<String> expectations = goalForm.control('expectations').value;
    profile.expectancies = List.generate(
      expectations.length,
      (index) => Expectancy(
        id: index,
        userId: profile.id,
        text: expectations[index],
      ),
    );
    profile.interests = MockAuthService.instance.selectedInterests;
    profile.favoriteSong = MockAuthService.instance.favoriteSong.value;

    return Future.delayed(
      const Duration(milliseconds: 250),
      () => http.Response(
        '',
        200,
      ),
    );
  }

  @override
  Future<http.Response> login() async {
    if (loginForm.invalid) {
      return Future.delayed(
        const Duration(milliseconds: 0),
        () => http.Response('body', 403),
      );
    }

    String response =
        await rootBundle.loadString('assets/mock-data/mock_logins.json');
    List<MockLogin> logins = List.from(
      json.decode(response).map(
            (element) => MockLogin.fromJson(element),
          ),
    );

    String email = loginForm.control('email').value as String;
    bool anyLoginPresent = logins.any(
      (element) => element.email.contains(email),
    );

    if (!anyLoginPresent) {
      return Future.delayed(
          const Duration(milliseconds: 500),
          () => http.Response(
                '{ "isFilled": false, "message": "There is no such user" }',
                404,
              ));
    }

    String password = loginForm.control('password').value as String;
    bool isCredentialsCorrect = logins.any(
      (element) => element.email == email && element.password == password,
    );

    if (!isCredentialsCorrect) {
      return Future.delayed(
        const Duration(milliseconds: 500),
        () => http.Response(
          '{ "isFilled": false, "message": "Incorrect password" }',
          403,
        ),
      );
    }

    MockLogin login = logins.firstWhere(
      (login) => login.password == password && login.email == email,
    );
    String profileResponse =
        await rootBundle.loadString('assets/mock-data/mock_users.json');

    UserProfile profile = usersFromJson(profileResponse).firstWhere(
      (user) => user.id == login.userId,
    );

    MockProfileService.instance.setUserProfile(profile);

    return Future.delayed(
      const Duration(milliseconds: 250),
      () => http.Response(
        '{ "isFilled": true }',
        200,
      ),
    );
  }
}
