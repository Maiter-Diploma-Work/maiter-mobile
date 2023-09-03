import 'package:flutter/material.dart';

class ProfilePicture extends StatefulWidget {
  final String pictureUrl;
  final double? radius;
  EdgeInsets? padding;
  bool? hasBoxShadow;
  bool? isRound;

  ProfilePicture(
      {super.key,
      required this.pictureUrl,
      this.padding,
      this.hasBoxShadow,
      this.isRound,
      this.radius});

  @override
  State<StatefulWidget> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  BoxDecoration boxDecoration = const BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black45,
        blurRadius: 24.0,
        offset: Offset(6, 12),
      ),
    ],
    color: Colors.amber,
  );

  Widget imageGenerator(bool isRound) {
    if (!isRound) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(68.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(68.0),
          child: Image(
            image: AssetImage(widget.pictureUrl),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return CircleAvatar(
        radius: widget.radius,
        backgroundImage: AssetImage(widget.pictureUrl),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: imageGenerator(widget.isRound ?? false),
    );
  }
}
