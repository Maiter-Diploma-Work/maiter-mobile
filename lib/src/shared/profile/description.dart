import 'package:flutter/material.dart';

class ProfileDescription extends StatefulWidget {
  final String? description;

  const ProfileDescription({super.key, required this.description});

  @override
  State<StatefulWidget> createState() => _ProfileDescriptionState();
}

class _ProfileDescriptionState extends State<ProfileDescription> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.description ?? '',
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w300,
        height: 1.25,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
