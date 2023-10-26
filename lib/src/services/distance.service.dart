import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

class DistanceService {
  static DistanceService? _instance;

  static DistanceService get instance {
    _instance ??= DistanceService();

    return _instance!;
  }

  double distanceBetweenLatLngs(LatLng location1, LatLng location2) {
    const R = 6372.8; //Earth radius in KM

    final double latitudeDelta =
        _toRadians(location1.latitude - location2.latitude);
    final double longitudeDelta =
        _toRadians(location1.longitude - location2.longitude);

    final double lat1Radians = _toRadians(location1.latitude);
    final double lat2Radians = _toRadians(location2.latitude);

    final double a = _haversin(latitudeDelta) +
        cos(lat1Radians) * cos(lat2Radians) * _haversin(longitudeDelta);

    final double c = 2 * asin(sqrt(a));

    return R * c;
  }

  double _toRadians(double degrees) {
    return degrees * pi / 180;
  }

  double _haversin(double radians) {
    return pow(sin(radians / 2), 2).toDouble();
  }
}
