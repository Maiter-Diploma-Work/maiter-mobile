import 'dart:async';

import 'package:amica/src/models/shared/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AmicaGoogleMaps extends StatefulWidget {
  final Location location;
  const AmicaGoogleMaps({super.key, required this.location});

  @override
  State<AmicaGoogleMaps> createState() => _AmicaGoogleMapsState();
}

class _AmicaGoogleMapsState extends State<AmicaGoogleMaps> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late CameraPosition _kGooglePlex;

  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _kGooglePlex = CameraPosition(
      target: LatLng(widget.location.latitude, widget.location.longitude),
      zoom: 17,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _kGooglePlex,
      mapType: MapType.normal,
      onTap: (latLng) {
        setState(() {
          _markers.clear();
          _markers.add(
            Marker(
              markerId: const MarkerId('newAmicaMarkerId'),
              position: latLng,
              icon: BitmapDescriptor.defaultMarker,
            ),
          );
        });
      },
      markers: Set.from(_markers),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      
      onMapCreated: (controller) {
        _controller.complete(controller);
      },
    );
  }
}
