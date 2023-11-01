import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

typedef OnUpdate = void Function(LatLng location);

class AmicaGoogleMaps extends StatefulWidget {
  final LatLng location;
  final OnUpdate? onUpdate;

  const AmicaGoogleMaps({
    super.key,
    required this.location,
    this.onUpdate,
  });

  @override
  State<AmicaGoogleMaps> createState() => _AmicaGoogleMapsState();
}

class _AmicaGoogleMapsState extends State<AmicaGoogleMaps> {
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

  void _onTap(LatLng destinationLocation) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('newAmicaMarkerId'),
          position: destinationLocation,
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
      _markers.add(
        Marker(
          markerId: const MarkerId('myAmicaMarkerId'),
          position: LatLng(
            widget.location.latitude,
            widget.location.longitude,
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(30),
        ),
      );
    });
    _setPolylines(
      LatLng(
        widget.location.latitude,
        widget.location.longitude,
      ),
      destinationLocation,
    );

    if (widget.onUpdate != null) widget.onUpdate!(destinationLocation);
  }

  @override
  void initState() {
    super.initState();
    _kGooglePlex = CameraPosition(
      target: LatLng(widget.location.latitude, widget.location.longitude),
      zoom: 17,
    );

    _markers.add(
      Marker(
        markerId: const MarkerId('myAmicaMarkerId'),
        position: LatLng(
          widget.location.latitude,
          widget.location.longitude,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(30),
      ),
    );
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
        onTap: _onTap,
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
