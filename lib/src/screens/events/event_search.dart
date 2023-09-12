import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/screens/events/event_serach_google-maps.dart';
import 'package:amica/src/shared/google_maps.dart';
import 'package:amica/src/shared/profile/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventSearchView extends StatefulWidget {
  final UserProfile user;
  const EventSearchView({super.key, required this.user});

  @override
  State<EventSearchView> createState() => _EventSearchViewState();
}

class _EventSearchViewState extends State<EventSearchView> {
  late List<Event> _events = [];

  Future<void> _readMockedEvents() async {
    final String response =
        await rootBundle.loadString('assets/mock_events.json');

    setState(() {
      _events = eventsFromJson(response);
    });
  }

  double _getLastThreeDecimalDigits(double position) {
    String positionString = position.toString();
    String lastDigits = positionString.characters
        .getRange(positionString.length - 2)
        .toString();

    return double.parse(lastDigits);
  }

  List<Widget> get events {
    return List.from(
      _events.map(
        (e) => Positioned(
          top: _getLastThreeDecimalDigits(e.location.longitude),
          left: _getLastThreeDecimalDigits(e.location.latitude),
          child: GestureDetector(
            onTap: () => context.go('/events/detailed', extra: e),
            child: Column(
              children: [
                ProfilePicture(
                  pictureUrl: e.photo,
                  isRound: true,
                  radius: 32,
                ),
                Text(e.name),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _readMockedEvents();
  }

  @override
  Widget build(BuildContext context) {
    LatLng location = LatLng(
      widget.user.location.latitude,
      widget.user.location.longitude,
    );
    return Stack(
      fit: StackFit.expand,
      children: [
        // AmicaGoogleMaps(location: location),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () => context.go('/events/create'),
            child: ProfilePicture(
              pictureUrl: widget.user.photo,
              isRound: true,
              radius: 32,
            ),
          ),
        ),
        ...events,
      ],
    );
  }
}
