import 'package:amica/src/models/filters/age_range.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/models/shared/interest.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class UserSearchService {
  final FormGroup userSearchFilterForm = FormGroup({
    "distance": FormControl<double>(),
    "age": FormControl<AgeRange>(),
    "lookingFor": FormControl<String>(),
    "interests": FormControl<List<String>>(),
  });

  Future<void> initializeFilters(UserProfile profile);

  //Get
  Future<UserProfile> getUser(String id);

  Future<List<UserProfile>> getCertainUsers(List<int> ids);

  Future<List<UserProfile>> getRandomUsers(int limit);
}
