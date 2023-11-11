import 'package:amica/src/models/filters/event_filter.dart';
import 'package:amica/src/models/filters/range.dart';
import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/models/shared/location.dart';
import 'package:amica/src/services/distance.service.dart';
import 'package:amica/src/services/event/event.service.dart';
import 'package:amica/src/services/profile/mock_profile.service.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MockEventService extends EventService {
  static MockEventService? _instance;

  static int _mockEventId = 32;

  static MockEventService get instance {
    _instance ??= MockEventService();

    return _instance!;
  }

  MockEventService() {
    initializeFilters(MockProfileService.instance.userProfile!);
  }

  @override
  Future<List<Event>> getCertainEvents(List<int> ids) async {
    final String response =
        await rootBundle.loadString('assets/mock-data/mock_events.json');

    List<Event> eventSource = eventsFromJson(response);

    List<Event> result = [];
    for (int id in ids) {
      result.add(eventSource.firstWhere((x) => x.id == id));
    }

    return result;
  }

  @override
  Future<Event> getEvent(String id) async {
    final String response =
        await rootBundle.loadString('assets/mock-data/mock_events.json');

    List<Event> eventSource = eventsFromJson(response);

    return eventSource.firstWhere((x) => x.id.toString() == id);
  }

  @override
  Future<List<Event>> getRandomEvents(
    UserProfile profile, {
    int limit = -1,
    EventFilter? filter,
  }) async {
    final String response =
        await rootBundle.loadString('assets/mock-data/mock_events.json');

    List<Event> eventSource = eventsFromJson(response);

    filter ??= EventFilter.fromJson({
      'id': -1,
      'userId': profile.id,
      'distance': eventSearchFilterForm.value['distance'] as double,
      'age': {
        "min": (eventSearchFilterForm.value['age'] as Range).min,
        "max": (eventSearchFilterForm.value['age'] as Range).max,
      },
      'lookingFor': eventSearchFilterForm.value['lookingFor'] as String,
    });

    if (limit != -1) {
      int end = limit > eventSource.length ? eventSource.length : limit;
      eventSource = eventSource.getRange(0, end).toList();
    }

    List<Event> tmp = eventSource;
    if (filter.lookingFor != 'Anyone') {
      tmp =
          tmp.where((event) => event.lookingFor == filter!.lookingFor).toList();
    }
    tmp = tmp
        .where(
          (event) => event.lookingFor == 'Anyone'
              ? true
              : event.lookingFor == profile.gender,
        )
        .toList();

    if (filter.age.min != -1) {
      tmp = tmp.where((event) => event.minAge >= filter!.age.min).toList();
    }
    if (filter.age.max != -1) {
      tmp = tmp.where((event) => event.maxAge <= filter!.age.max).toList();
    }
    if (filter.distance != -1) {
      tmp = tmp.where((element) {
        LatLng eventLocation = LatLng(
          element.location.latitude,
          element.location.longitude,
        );

        LatLng userLocation = LatLng(
          MockProfileService.instance.userProfile!.location.latitude,
          MockProfileService.instance.userProfile!.location.longitude,
        );

        double deltaDistance = DistanceService.instance.distanceBetweenLatLngs(
          eventLocation,
          userLocation,
        );

        double distance =
            eventSearchFilterForm.control('distance').value as double;
        return deltaDistance <= distance;
      }).toList();
    }

    return tmp;
  }

  @override
  Future<void> initializeFilters(UserProfile profile) async {
    String response =
        await rootBundle.loadString('assets/mock-data/mock_event_filter.json');
    EventFilter filter = eventFiltersFromJson(response)
        .firstWhere((element) => element.userId == profile.id);

    for (MapEntry element in filter.toJson().entries) {
      if (element.key == 'age') {
        eventSearchFilterForm.control('age').value =
            Range.fromJson(element.value);
      } else if (eventSearchFilterForm.controls.keys.contains(element.key)) {
        eventSearchFilterForm.control(element.key).value = element.value;
      }
    }
  }

  @override
  Future<Event> createEvent() {
    _mockEventId++;

    UserProfile user = MockProfileService.instance.userProfile!;

    return Future.delayed(
      const Duration(milliseconds: 250),
      () => Event(
        creatorId: user.id,
        creationDate: DateTime.now(),
        amountOfPeople: createEventForm.control('amountOfPeople').value,
        lookingFor: createEventForm.control('lookingFor').value,
        minAge: createEventForm.control('ageConstraints').value.min,
        maxAge: createEventForm.control('ageConstraints').value.max,
        radius: DistanceService.instance.distanceBetweenLatLngs(
          createEventForm.control('location').value,
          LatLng(
            user.location.latitude,
            user.location.longitude,
          ),
        ),
        id: _mockEventId,
        location: Location(
          countryName: 'Ukraine',
          id: _mockEventId,
          latitude: createEventForm.control('location').value.latitude,
          longitude: createEventForm.control('location').value.longitude,
          name: 'Zaporizhzhia',
          postcode: '69019',
        ),
        description: createEventForm.control('description').value,
        name: user.name,
        photo: user.photo,
        interests: user.interests,
        endDate: DateTime.utc(2073),
      ),
    );
  }
}
