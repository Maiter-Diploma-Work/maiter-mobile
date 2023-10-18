import 'package:amica/src/models/filters/age_range.dart';
import 'package:amica/src/models/filters/event_filter.dart';
import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/event/event.service.dart';
import 'package:flutter/services.dart';

class MockEventService extends EventService {
  static MockEventService? _instance;

  static MockEventService get instance {
    _instance ??= MockEventService();

    return _instance!;
  }

  @override
  Future<List<Event>> getCertainEvents(List<int> ids) {
    // TODO: implement getCertainEvents
    throw UnimplementedError();
  }

  @override
  Future<Event> getEvent(String id) {
    // TODO: implement getEvent
    throw UnimplementedError();
  }

  @override
  Future<List<Event>> getRandomEvents(int limit) {
    // TODO: implement getRandomEvents
    throw UnimplementedError();
  }

  @override
  Future<void> initializeFilters(UserProfile profile) async {
    String response =
        await rootBundle.loadString('assets/mock_event_filter.json');
    EventFilter filter = eventFiltersFromJson(response)
        .firstWhere((element) => element.userId == profile.id);

    for (MapEntry element in filter.toJson().entries) {
      if (element.key == 'age') {
        eventSearchFilterForm.control('age').value =
            AgeRange.fromJson(element.value);
      } else if (eventSearchFilterForm.controls.keys.contains(element.key)) {
        eventSearchFilterForm.control(element.key).value = element.value;
      }
    }
  }
}
