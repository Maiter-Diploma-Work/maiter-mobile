import 'package:flutter/material.dart';

class UserProfileName extends StatefulWidget {
  final String name;
  final int age;

  const UserProfileName({super.key, required this.name, required this.age});

  @override
  State<StatefulWidget> createState() => _UserProfileNameState();
}

class _UserProfileNameState extends State<UserProfileName> {
  List<Widget> getProfileName() {
    return [textGenerator(widget.name), textGenerator(widget.age.toString())];
  }

  Widget textGenerator(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 20.0, right: 20.0, top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: getProfileName(),
      ),
    );
  }
}
