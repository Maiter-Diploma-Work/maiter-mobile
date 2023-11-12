import 'package:amica/src/models/filters/event_filter.dart';
import 'package:amica/src/models/filters/range.dart';
import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class EventService {
  final FormGroup eventSearchFilterForm = FormGroup({
    "distance": FormControl<double>(),
    "age": FormControl<Range>(),
    "lookingFor": FormControl<String>(),
  });

  final FormGroup createEventForm = FormGroup({
    'description': FormControl<String>(),
    'lookingFor': FormControl<String>(),
    'range': FormControl<double>(value: 1),
    'amountOfPeople': FormControl<double>(value: 1),
    'ageConstraints': FormControl<Range>(value: Range(min: 18, max: 90)),
    'location': FormControl<LatLng>(),
  });

  late UserProfile _profile;
  List<Event> events = [];

  Future<void> initializeFilters(UserProfile profile);

  //Get
  Future<Event> getEvent(String id);

  Future<List<Event>> getCertainEvents(List<int> ids);

  Future<List<Event>> getRandomEvents(UserProfile profile, {
    int limit = -1,
    EventFilter? filter,
  });

  //Post
  Future<Event> createEvent();
}
