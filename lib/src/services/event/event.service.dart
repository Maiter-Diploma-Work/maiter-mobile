import 'package:amica/src/models/filters/age_range.dart';
import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class EventService {
  final FormGroup eventSearchFilterForm = FormGroup({
    "distance": FormControl<double>(),
    "age": FormControl<AgeRange>(),
    "lookingFor": FormControl<String>(),
  });

  late UserProfile _profile;

  Future<void> initializeFilters(UserProfile profile);

  //Get
  Future<Event> getEvent(String id);

  Future<List<Event>> getCertainEvents(List<int> ids);

  Future<List<Event>> getRandomEvents(int limit);
}
