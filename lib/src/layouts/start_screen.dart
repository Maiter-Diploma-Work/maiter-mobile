import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  final Widget screenBody;
  final bool? hasBackgroundImage;

  const StartScreen({
    Key? key,
    required this.screenBody,
    this.hasBackgroundImage,
  }) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  ColorFilter get _imageFilter {
    return const ColorFilter.matrix(<double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
  }

  DecorationImage? get _backgroundImage {
    if (widget.hasBackgroundImage == null || !widget.hasBackgroundImage!) {
      return null;
    }

    return DecorationImage(
      image: const AssetImage('assets/welcome_screen_bg_image.webp'),
      fit: BoxFit.cover,
      opacity: 0.2,
      colorFilter: _imageFilter,
      repeat: ImageRepeat.noRepeat,
      alignment: Alignment.bottomLeft,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF303F9F),
              Color(0xFF3344B0),
              Color(0xFF7128E9),
              Color(0xFF7E18FF),
            ],
            transform: GradientRotation(1.5),
          ),
          image: _backgroundImage,
        ),
        child: widget.screenBody,
      ),
    );
  }
}
