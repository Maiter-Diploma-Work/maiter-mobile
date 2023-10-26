import 'package:amica/src/models/filters/event_filter.dart';
import 'package:amica/src/models/filters/range.dart';
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
  Future<List<Event>> getCertainEvents(List<int> ids) async {
    final String response =
        await rootBundle.loadString('assets/mock_events.json');

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
        await rootBundle.loadString('assets/mock_events.json');

    List<Event> eventSource = eventsFromJson(response);

    return eventSource.firstWhere((x) => x.id.toString() == id);
  }

  @override
  Future<List<Event>> getRandomEvents(int limit) async {
    final String response =
        await rootBundle.loadString('assets/mock_events.json');

    List<Event> eventSource = eventsFromJson(response);

    return eventSource;
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
            Range.fromJson(element.value);
      } else if (eventSearchFilterForm.controls.keys.contains(element.key)) {
        eventSearchFilterForm.control(element.key).value = element.value;
      }
    }
  }
}
