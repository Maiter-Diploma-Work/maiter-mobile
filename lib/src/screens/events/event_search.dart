import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/screens/events/event_list_item/event_list_item.dart';
import 'package:amica/src/services/event/event.service.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventSearchView extends StatefulWidget {
  final UserProfile user;
  final EventService eventService;

  const EventSearchView({
    super.key,
    required this.user,
    required this.eventService,
  });

  @override
  State<EventSearchView> createState() => _EventSearchViewState();
}

class _EventSearchViewState extends State<EventSearchView> {
  late List<Event> _events = [];

  Future<void> _readMockedEvents() async {
    await widget.eventService.getRandomEvents(
      widget.user,
    );
    setState(() {
      _events = widget.eventService.events;
    });
  }

  @override
  void initState() {
    super.initState();
    _readMockedEvents();
  }

  @override
  Widget build(BuildContext context) {
    if (_events.isEmpty) {
      return const Center(
        child: Text(
          'There is no events found in the area...',
          style: TextStyle(
            fontSize: 32,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    LatLng location = LatLng(
      widget.user.location.latitude,
      widget.user.location.longitude,
    );
    return SingleChildScrollView(
      child: Column(
        children: List.from(
          _events.map(
            (e) => Column(
              children: [
                EventListItem(
                  event: e,
                  location: location,
                ),
                const Gap(verticalGap: 32.0, horizontalGap: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
