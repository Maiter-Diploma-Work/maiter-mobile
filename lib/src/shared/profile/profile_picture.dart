import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String pictureUrl;
  final double? radius;
  final double? borderRadius;
  EdgeInsets? padding;
  bool? hasBoxShadow;
  bool? isRound;

  ProfilePicture({
    super.key,
    required this.pictureUrl,
    this.padding,
    this.hasBoxShadow,
    this.isRound,
    this.radius,
    this.borderRadius,
  });

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
    if (isRound) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(pictureUrl),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 68.0),
      child: Image(
        image: AssetImage(pictureUrl),
        height: 512,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (pictureUrl.isEmpty &&
        (isRound == null || isRound != null && isRound == false)) {
      return Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurStyle: BlurStyle.outer,
              blurRadius: 32,
              spreadRadius: 8,
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        height: 512,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(32),
        child: const Center(
          child: Text(
            'Apparently this photo is unavailable for some reason :/',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32),
          ),
        ),
      );
    }
    if (pictureUrl.isEmpty && isRound != null && isRound == true) {
      return CircleAvatar(
        radius: radius ?? 16,
        child: const Text('No image :('),
      );
    }

    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: imageGenerator(isRound ?? false),
    );
  }
}
