import 'dart:async';
import 'dart:ui' as ui;

import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/shared/profile/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AmicaEventSearchGoogleMaps extends StatefulWidget {
  final LatLng userPosition;
  final String userPhotoUrl;
  final Set<Event> eventMarkers;

  const AmicaEventSearchGoogleMaps({
    super.key,
    required this.userPosition,
    required this.userPhotoUrl,
    required this.eventMarkers,
  });

  AmicaEventSearchGoogleMaps.withUserProfile({
    super.key,
    required UserProfile profile,
    required this.eventMarkers,
  })  : userPhotoUrl = profile.photo,
        userPosition = LatLng(
          profile.location.latitude,
          profile.location.longitude,
        );

  @override
  State<AmicaEventSearchGoogleMaps> createState() =>
      _AmicaEventSearchGoogleMapsState();
}

class _AmicaEventSearchGoogleMapsState
    extends State<AmicaEventSearchGoogleMaps> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final Set<Marker> _markers = {};

  Future<void> _initState() async {
    setState(() async {
      _markers.add(
        Marker(
          markerId: const MarkerId('me'),
          position: widget.userPosition,
          onTap: () => context.go('/events/create'),
          icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size.square(16)),
            'assets/valery_doe.jpg',
          ),
        ),
      );
      _markers.addAll(_generateEventMarkers);
    });
  }

  @override
  void initState() {
    super.initState();
    _initState();
  }

  Iterable<Marker> get _generateEventMarkers {
    return widget.eventMarkers.map(
      (e) => Marker(
        markerId: MarkerId(e.name),
        position: LatLng(e.location.latitude, e.location.longitude),
        onTap: () => context.go('/events/detailed', extra: e),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget.userPosition,
        zoom: 15,
      ),
      markers: _markers,
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onMapCreated: (controller) {
        _controller.complete(controller);
      },
    );
  }
}
