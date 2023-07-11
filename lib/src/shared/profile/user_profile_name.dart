import 'package:flutter/material.dart';

class UserProfileName extends StatefulWidget {
  final String name;
  final String tag;
  final int age;

  const UserProfileName(
      {super.key, required this.name, required this.age, required this.tag});

  @override
  State<StatefulWidget> createState() => _UserProfileNameState();
}

class _UserProfileNameState extends State<UserProfileName> {
  List<Widget> getProfileName() {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textGenerator(widget.name),
          Text(
            widget.tag,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
      textGenerator(widget.age.toString())
    ];
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
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 8.0, left: 20.0, right: 20.0, top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: getProfileName(),
        ),
      ),
    );
  }
}
