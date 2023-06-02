import 'package:flutter/material.dart';

class ProfilePicture extends StatefulWidget {
  final String pictureUrl;

  const ProfilePicture({super.key, required this.pictureUrl});

  @override
  State<StatefulWidget> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  BoxDecoration boxDecoration = const BoxDecoration(boxShadow: [
    BoxShadow(color: Colors.black45, blurRadius: 24.0, offset: Offset(6, 12)),
  ]);

  RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(14.0),
  );

  Widget imageGenerator() {
    return Card(
      shape: shape,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.0),
        child: const Image(
            //TODO: make the image dynamic instead of constants
            image: AssetImage('assets/anna_shapovalova.PNG'),
            fit: BoxFit.contain),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Container(
        decoration: boxDecoration,
        child: imageGenerator(),
      ),
    );
  }
}
