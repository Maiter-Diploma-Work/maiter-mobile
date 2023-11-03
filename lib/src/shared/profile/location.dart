import 'package:flutter/material.dart';

import '../../models/shared/location.dart';

class LocationView extends StatelessWidget {
  final Location location;

  const LocationView({super.key, required this.location});

  List<Widget> textGenerator(BuildContext context) {
    return [
      const Icon(
        Icons.place_outlined,
        color: Colors.white,
      ),
      Text(
        location.name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        children: textGenerator(context),
      ),
    );
  }
}
