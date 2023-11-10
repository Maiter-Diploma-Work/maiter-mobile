import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/services/distance.service.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/profile/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventListItem extends StatelessWidget {
  final Event event;
  final LatLng location;

  const EventListItem({
    super.key,
    required this.event,
    required this.location,
  });

  void _onTap(BuildContext context) {
    context.go('/events/detailed', extra: event);
  }

  String _dateToString(DateTime date) {
    return '${date.year}.${date.month}.${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: GestureDetector(
          onTap: () => _onTap(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _generateAuthorPersonalInfo(),
              Column(
                children: [
                  Text('from ${_dateToString(event.creationDate)}'),
                  Text('due ${_dateToString(event.endDate)}'),
                ],
              )
            ],
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: 1,
        color: Theme.of(context).colorScheme.inverseSurface,
      ),
    ]);
  }

  Widget get _nameGenerator {
    return Text(
      event.name,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget get _locationGenerator {
    final DistanceService distanceService = DistanceService.instance;

    final LatLng eventLocation = LatLng(
      event.location.latitude,
      event.location.longitude,
    );

    print({eventLocation.toJson(), location.toJson()});

    final String distance = distanceService
        .distanceBetweenLatLngs(eventLocation, location)
        .toStringAsFixed(2);

    return Text(
      '$distance KM away',
    );
  }

  Widget _generateAuthorPersonalInfo() {
    return Row(
      children: [
        ProfilePicture(
          pictureUrl: event.photo,
          isRound: true,
          radius: 28,
        ),
        const Gap(verticalGap: 0, horizontalGap: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _nameGenerator,
            _locationGenerator,
          ],
        ),
      ],
    );
  }
}
