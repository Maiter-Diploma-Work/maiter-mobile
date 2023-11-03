import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:flutter/material.dart';

class UserProfileName extends StatelessWidget {
  final String name;
  final String tag;
  final DateTime birthdate;
  final Color? textColor;
  final EdgeInsets? padding;

  const UserProfileName({
    super.key,
    required this.name,
    required this.birthdate,
    required this.tag,
    this.padding,
    this.textColor,
  });

  factory UserProfileName.fromProfile(
    UserProfile profile, {
    Key? key,
    EdgeInsets? padding,
    Color? textColor,
  }) =>
      UserProfileName(
        name: profile.name,
        birthdate: profile.birthDate,
        tag: profile.tag,
        key: key,
        padding: padding,
        textColor: textColor,
      );

  List<Widget> getProfileName() {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textGenerator(name),
          Text(
            tag,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      textGenerator((DateTime.now().year - birthdate.year).toString()),
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
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: getProfileName(),
      ),
    );
  }
}
