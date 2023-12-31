import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AmicaStaticGoogleMaps extends StatefulWidget {
  final LatLng location;
  final LatLng destination;

  const AmicaStaticGoogleMaps({
    super.key,
    required this.location,
    required this.destination,
  });

  @override
  State<AmicaStaticGoogleMaps> createState() => _AmicaStaticGoogleMapsState();
}

class _AmicaStaticGoogleMapsState extends State<AmicaStaticGoogleMaps> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};
  final List<LatLng> _polylineCoordinates = [];

  late CameraPosition _kGooglePlex;

  void _setPolylines(LatLng sourceLocation, LatLng destinationLocation) async {
    _polylines.clear();
    _polylineCoordinates.clear();

    PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
      'AIzaSyDw7z8fhOELmMRfEhwdFIytOCsOEUBg8N0',
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(
        destinationLocation.latitude,
        destinationLocation.longitude,
      ),
      travelMode: TravelMode.walking,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        _polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
    }

    setState(() {
      Polyline polyline = Polyline(
        polylineId: const PolylineId("path"),
        color: Theme.of(context).colorScheme.primary,
        points: _polylineCoordinates,
      );

      _polylines.add(polyline);
    });
  }

  @override
  void initState() {
    super.initState();

    _setPolylines(
      widget.location,
      widget.destination,
    );

    _kGooglePlex = CameraPosition(
      target: LatLng(widget.location.latitude, widget.location.longitude),
      zoom: 17,
    );

    _markers.addAll({
      Marker(
        markerId: const MarkerId('newAmicaMarkerId'),
        position: widget.destination,
        icon: BitmapDescriptor.defaultMarker,
      ),
      Marker(
        markerId: const MarkerId('myAmicaMarkerId'),
        position: widget.location,
        icon: BitmapDescriptor.defaultMarkerWithHue(30),
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          16,
        ),
      ),
      child: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        polylines: _polylines,
        markers: _markers,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
