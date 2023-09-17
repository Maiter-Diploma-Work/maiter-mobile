import 'package:amica/src/models/DTO/User/edit_user_dto.dart';
import 'package:amica/src/models/profiles/user_profile.dart';

abstract class UserSearchService {
  //Get
  Future<UserProfile> getUser(String id);
  Future<List<UserProfile>> getCertainUsers(List<String> ids);
  Future<List<UserProfile>> getRandomUsers(int limit);
  
  //Put
  Future<void> updateUser(String id, EditUserDto newUser);

  //Delete
  Future<void> deleteUser(String id);
}