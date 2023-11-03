import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String pictureUrl;
  final double? radius;
  final double? borderRadius;
  EdgeInsets? padding;
  bool? hasBoxShadow;
  bool? isRound;

  ProfilePicture(
      {super.key,
      required this.pictureUrl,
      this.padding,
      this.hasBoxShadow,
      this.isRound,
      this.radius,
      this.borderRadius});

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
          borderRadius: BorderRadius.circular(borderRadius ?? 68.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 68.0),
          child: Image(
            image: AssetImage(pictureUrl),
            height: 512,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(pictureUrl),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: imageGenerator(isRound ?? false),
    );
  }
}
