import 'dart:math';

import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/profile/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  List<Widget> get events {
    return List.from(
      _events.map(
        (e) => Positioned(
          top: e.location.latitude.round().toDouble() +
              Random(DateTime.now().millisecond).nextDouble() * 10,
          left: e.location.longitude.round().toDouble() +
              Random(DateTime.now().millisecond).nextDouble() * 10,
          child: Column(
            children: [
              ProfilePicture(
                pictureUrl: e.photo,
                isRound: true,
                radius: 51.5,
              ),
              Text(e.name),
            ],
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
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.center,
          child: ProfilePicture(
            pictureUrl: widget.user.photo,
            isRound: true,
            radius: 51.5,
          ),
        ),
        ...events,
      ],
    );
  }
}
