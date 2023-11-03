import 'package:amica/src/models/filters/range.dart';
import 'package:amica/src/models/filters/user_filter.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/user/user_search.service.dart';
import 'package:flutter/services.dart';

class MockedUserSearchService extends UserSearchService {
  static UserSearchService? _instance;

  static UserSearchService get instance {
    _instance ??= MockedUserSearchService();

    return _instance!;
  }

  Future<List<UserProfile>> getUserProfiles() async {
    final List<String> userIds =
        List.generate(6, (index) => (index + 1).toString());

    final String response =
        await rootBundle.loadString('assets/mock_users.json');
    final List<UserProfile> data = usersFromJson(response);

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
  Future<List<UserProfile>> getRandomUsers(int limit) async {
    List<UserProfile> response = await getUserProfiles();
    response.shuffle();

    if (limit != -1) {
      int start = limit > response.length ? response.length : limit;
      response.removeRange(start, response.length);
    }
    users = response;

    return response;
  }

  @override
  Future<void> initializeFilters(UserProfile profile) async {
    String response =
        await rootBundle.loadString('assets/mock_user_filter.json');
    UserFilter filter = userFiltersFromJson(response).firstWhere(
      (element) => element.userId == profile.id,
    );

    for (MapEntry element in filter.toJson().entries) {
      if (element.key == 'age') {
        userSearchFilterForm.control('age').value =
            Range.fromJson(element.value);
      } else if (userSearchFilterForm.controls.keys.contains(element.key)) {
        userSearchFilterForm.control(element.key).value = element.value;
      }
    }
  }
}
