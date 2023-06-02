import 'package:flutter/material.dart';

class ProfileDescription extends StatefulWidget {
  final String description;

  const ProfileDescription({super.key, required this.description});

  @override
  State<StatefulWidget> createState() => _ProfileDescriptionState();
}

class _ProfileDescriptionState extends State<ProfileDescription> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
      child: Text(
        widget.description,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
      ),
    );
  }
}
