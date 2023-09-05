import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/models/shared/location.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/google_maps.dart';
import 'package:amica/src/shared/profile/profile_picture.dart';
import 'package:amica/src/shared/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetailsView extends StatelessWidget {
  final Location userLocation;
  final Event event;
  const EventDetailsView(
      {super.key, required this.event, required this.userLocation});

  Widget _details(BuildContext context) {
    return Row(
      children: [
        _leftDetailsScreen(context),
        const Gap(verticalGap: 0, horizontalGap: 16),
        _rightDetailsSection(context),
      ],
    );
  }

  Widget _leftDetailsScreen(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      child: Column(
        children: [
          AmicaTitle(
            text: '${event.name} has created an event',
            fontStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(verticalGap: 6, horizontalGap: 0),
          Text('${event.description}'),
        ],
      ),
    );
  }

  Widget _rightDetailsSection(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () => context.go('/user/details', extra: event.creatorId),
          child: ProfilePicture(
            pictureUrl: event.photo,
            isRound: true,
            radius: 64,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AmicaGoogleMaps(
          location: LatLng(
            userLocation.latitude,
            userLocation.longitude,
          ),
          destination: LatLng(
            event.location.latitude,
            event.location.longitude,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Theme.of(context).colorScheme.primary,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: _details(context),
          ),
        )
      ],
    );
  }
}
