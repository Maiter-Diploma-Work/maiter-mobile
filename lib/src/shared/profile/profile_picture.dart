import 'package:flutter/material.dart';

class ProfilePicture extends StatefulWidget {
  final String pictureUrl;
  EdgeInsets? padding;
  bool? hasBoxShadow;
  bool? isRound;

  ProfilePicture({
    super.key,
    required this.pictureUrl,
    this.padding,
    this.hasBoxShadow,
    this.isRound,
  });

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
          child: const Image(
            //TODO: make the image dynamic instead of constants
            image: AssetImage('assets/anna_shapovalova.PNG'),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return const CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('assets/anna_shapovalova.PNG'),
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
