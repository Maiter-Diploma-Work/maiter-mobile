import 'package:flutter/material.dart';

class ProfileActionPanel extends StatefulWidget {
  final List<IconButton> iconButtons;

  const ProfileActionPanel({super.key, required this.iconButtons});

  @override
  State<StatefulWidget> createState() => _ProfileActionPanelState();
}

class _ProfileActionPanelState extends State<ProfileActionPanel> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.iconButtons,
      ),
    );
  }
}
