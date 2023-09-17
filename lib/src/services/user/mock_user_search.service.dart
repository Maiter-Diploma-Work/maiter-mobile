import 'package:amica/src/models/DTO/User/edit_user_dto.dart';
import 'package:amica/src/models/DTO/dislike_dto.dart';
import 'package:amica/src/models/DTO/like_dto.dart';
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
    final List<String> userIds = List.generate(6, (index) => (index + 1).toString());

    final String response =
        await rootBundle.loadString('assets/mock_users.json');
    final List<UserProfile> data = usersFromJson(response);

    return data;
  }

  @override
  Future<void> deleteUser(String id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserProfile> getUser(String id) async {
    return (await getUserProfiles()).firstWhere((element) => element.id == int.parse(id));
  }

  @override
  Future<List<UserProfile>> getCertainUsers(List<String> ids) async {
    List<UserProfile> response = await getUserProfiles();
    List<UserProfile> result = [];

    for (var user in response) {
      int id = int.parse(ids.firstWhere((element) => int.parse(element) == user.id));
      if (user.id == id) {
        result.add(user);
      }
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

    return response;
  }

  @override
  Future<void> updateUser(String id, EditUserDto newUser) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}