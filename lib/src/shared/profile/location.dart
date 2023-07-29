import 'package:flutter/material.dart';

import '../../models/shared/location.dart';

class LocationView extends StatefulWidget {
  final Location location;

  const LocationView({super.key, required this.location});

  @override
  State<StatefulWidget> createState() => _LocationState();
}

class _LocationState extends State<LocationView> {
  List<Widget> textGenerator() {
    return [
      const Icon(Icons.place_outlined),
      Text(
        widget.location.name,
        style: const TextStyle(fontSize: 18.0),
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
        children: textGenerator(),
      ),
    );
  }
}
