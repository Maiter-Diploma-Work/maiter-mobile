import 'package:amica/src/models/filters/range.dart';
import 'package:amica/src/models/filters/user_filter.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/distance.service.dart';
import 'package:amica/src/services/profile/mock_profile.service.dart';
import 'package:amica/src/services/user/user_search.service.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MockedUserSearchService extends UserSearchService {
  static UserSearchService? _instance;

  static UserSearchService get instance {
    _instance ??= MockedUserSearchService();

    return _instance!;
  }

  MockedUserSearchService() {
    initializeFilters(MockProfileService.instance.userProfile!);
  }

  Future<List<UserProfile>> getUserProfiles() async {
    final List<String> userIds =
    List.generate(6, (index) => (index + 1).toString());

    final String response =
    await rootBundle.loadString('assets/mock-data/mock_users.json');
    List<UserProfile> data = usersFromJson(response);

    return data;
  }

  @override
  Future<UserProfile> getUser(String id) async {
    return (await getUserProfiles())
        .firstWhere((element) => element.id == int.parse(id));
  }

  @override
  Future<List<UserProfile>> getCertainUsers(List<int> ids) async {
    List<UserProfile> response = await getUserProfiles();
    List<UserProfile> result = [];

    for (UserProfile user in response) {
      if (ids.contains(user.id)) {}
    }

    return result;
  }

  @override
  Future<List<UserProfile>> getRandomUsers(UserProfile profile, {
    int limit = -1,
    UserFilter? filter,
  }) async {
    await initializeFilters(profile);

    List<UserProfile> response = await getUserProfiles();
    response.removeWhere((element) => element.id == profile.id);

    response.shuffle();

    if (limit != -1) {
      int end = limit > response.length ? response.length : limit;
      response = response.getRange(0, end).toList();
    }

    filter ??= UserFilter.fromJson({
      "id": -1,
      "userId": profile.id,
      "distance": userSearchFilterForm.value['distance'] as double,
      "age": {
        "min": (userSearchFilterForm.value['age'] as Range).min,
        "max": (userSearchFilterForm.value['age'] as Range).max,
      },
      "lookingFor": userSearchFilterForm.value['lookingFor'] as String,
      "interests": [],
    });

    if (filter.lookingFor != 'Anyone') {
      response = response
          .where((element) => element.gender == filter!.lookingFor)
          .toList();
    }
    response = List.from(response.where(
          (user) =>
      user.lookingFor == "Anyone"
          ? true
          : user.lookingFor == profile.gender,
    ));

    response = response.where((user) {
      LatLng userLocation = LatLng(
        user.location.latitude,
        user.location.longitude,
      );
      LatLng profileLocation = LatLng(
        profile.location.latitude,
        profile.location.longitude,
      );

      double deltaDistance = DistanceService.instance.distanceBetweenLatLngs(
        userLocation,
        profileLocation,
      );
      return deltaDistance <= filter!.distance;
    }).toList();

    response = List.from(response.where(
          (user) {
        int userAge = (DateTime
            .now()
            .year - user.birthDate.year).abs();
        return userAge <= filter!.age.max && userAge >= filter.age.min;
      },
    ));

    users = response;
    return response;
  }

  @override
  Future<void> initializeFilters(UserProfile profile) async {
    String response =
    await rootBundle.loadString('assets/mock-data/mock_user_filter.json');
    UserFilter filter = userFiltersFromJson(response).firstWhere(
          (element) => element.userId == profile.id,
    );

    for (MapEntry element in filter
        .toJson()
        .entries) {
      if (element.key == 'age') {
        userSearchFilterForm
            .control('age')
            .value =
            Range.fromJson(element.value);
      } else if (userSearchFilterForm.controls.keys.contains(element.key)) {
        userSearchFilterForm
            .control(element.key)
            .value = element.value;
      }
    }
  }
}
