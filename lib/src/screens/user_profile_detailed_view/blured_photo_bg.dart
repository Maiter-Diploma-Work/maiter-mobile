import 'dart:ui';

import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:flutter/material.dart';

class BLuredPhotoBg extends StatefulWidget {
  final UserProfile profile;
  final Widget child;

  const BLuredPhotoBg({super.key, required this.profile, required this.child});

  @override
  State<StatefulWidget> createState() => _BLuredPhotoBgState();
}

class _BLuredPhotoBgState extends State<BLuredPhotoBg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/valery_doe.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.0),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
