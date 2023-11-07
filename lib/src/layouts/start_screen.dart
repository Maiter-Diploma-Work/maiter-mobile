import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final Widget screenBody;
  final bool? hasBackgroundImage;
  final bool? isWelcomeView;

  const StartScreen({
    Key? key,
    required this.screenBody,
    this.hasBackgroundImage,
    this.isWelcomeView,
  }) : super(key: key);

  ColorFilter get _imageFilter {
    return const ColorFilter.matrix(<double>[
      0.256,
      0.7152,
      0.0722,
      1,
      0,
      0.256,
      0.7152,
      0.0722,
      0,
      1,
      0.256,
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
    if (hasBackgroundImage == null || !hasBackgroundImage!) {
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

  BoxDecoration? welcomeViewGradientOrSolidColor(BuildContext context) {
    if (isWelcomeView == null || (isWelcomeView != null && !isWelcomeView!)) {
      return BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      );
    }

    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.primary.withRed(150),
        ],
        transform: GradientRotation(1.5),
      ),
      // color: const Color(0xFF4440AD),
      image: _backgroundImage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
        width: MediaQuery.of(context).size.width,
        decoration: welcomeViewGradientOrSolidColor(context),
        child: screenBody,
      ),
    );
  }
}
