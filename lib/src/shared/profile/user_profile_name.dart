import 'package:flutter/material.dart';

class UserProfileName extends StatefulWidget {
  final String name;
  final String tag;
  final int age;
  EdgeInsets? padding;

  UserProfileName({
    super.key,
    required this.name,
    required this.age,
    required this.tag,
    this.padding,
  });

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
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      textGenerator(widget.age.toString())
    ];
  }

  Widget textGenerator(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: getProfileName(),
      ),
    );
  }
}