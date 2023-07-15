import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maiter/src/models/profiles/user_profile.dart';
import 'package:maiter/src/models/shared/location.dart';
import 'package:maiter/src/screens/user_profile_detailed_view/blured_photo_bg.dart';
import 'package:maiter/src/shared/delimeter.dart';
import 'package:maiter/src/shared/gap.dart';
import 'package:maiter/src/shared/profile/description.dart';
import 'package:maiter/src/shared/profile/interests.dart';
import 'package:maiter/src/shared/profile/user_profile_name.dart';

class UserProfileDetailed extends StatefulWidget {
  final UserProfile profile;

  const UserProfileDetailed({super.key, required this.profile});

  @override
  State<StatefulWidget> createState() => _UserProfileDetailedState();
}

class _UserProfileDetailedState extends State<UserProfileDetailed> {
  void onDrag(DragUpdateDetails details, BuildContext context) {
    int sensitivity = 8;
    if (details.delta.dx > sensitivity) {
      // Right Swipe
      debugPrint('Right Swipe, $sensitivity');
      context.go('/search/user');
    } else if (details.delta.dx < -sensitivity) {
      //Left Swipe
      debugPrint('Left Swipe, $sensitivity');
    }
  }

  Widget textGenerator(String text,
      [FontWeight? fontWeight, double? fontSize]) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 18.0,
        fontWeight: fontWeight ?? FontWeight.w300,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) =>
          onDrag(details, context),
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          BLuredPhotoBg(
            profile: widget.profile,
            child: generateBasicInfo(),
          ),
          generateAdditionalInfo(context),
        ],
      ),
    );
  }

  Widget generateAdditionalInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        left: 50,
        right: 50,
        bottom: 52,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          education,
          generateDelimeter(widget.profile.education != null),
          location,
          const Delimeter(
            bottomMargin: 12,
            topMargin: 2,
          ),
          socialNetworks,
          generateDelimeter(widget.profile.socialNetworks != null),
          ProfileDescription(
            description: widget.profile.description,
          ),
          const Gap(
            verticalGap: 46,
            horizontalGap: 0,
          ),
          generateAdditionalPhotos(),
        ],
      ),
    );
  }

  //TODO: Fetch all the data from the backend
  Widget generateAdditionalPhotos() {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        generateAdditionalPhoto('assets/anna_shapovalova_1.jpg'),
        generateAdditionalPhoto('assets/anna_shapovalova_2.jpg'),
        generateAdditionalPhoto('assets/anna_shapovalova_3.jpg'),
        generateAdditionalPhoto('assets/anna_shapovalova_4.jpg'),
      ],
    );
  }

  Widget generateAdditionalPhoto(String path) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.35,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: Image.asset(path),
      ),
    );
  }

  Widget generateDelimeter(bool shouldRender) {
    if (!shouldRender) return Container();

    return const Delimeter(
      bottomMargin: 12,
      topMargin: 4,
    );
  }

  Widget get education {
    String? education = widget.profile.education;
    if (education == null) return Container();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // textGenerator('education: ', FontWeight.w500),
        const Gap(verticalGap: 0, horizontalGap: 14.0),
        textGenerator(education),
      ],
    );
  }

  Widget get location {
    final Location tmp = widget.profile.location;
    String location = "${tmp.countryName}, ${tmp.name}";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textGenerator(location),
      ],
    );
  }

  Widget get socialNetworks {
    final Map<String, String>? socialNetworks = widget.profile.socialNetworks;
    if (socialNetworks == null) return Container();

    List<Widget> networks = List.generate(
      socialNetworks.length,
      (index) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap.cubic(16),
          textGenerator(
            '- ${socialNetworks.keys.elementAt(index)}:',
            FontWeight.w500,
          ),
          const Gap(verticalGap: 0, horizontalGap: 14.0),
          textGenerator(
            socialNetworks.values.elementAt(index),
          ),
        ],
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: networks,
    );
  }

  Widget generateBasicInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 90, bottom: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('assets/anna_shapovalova.PNG'),
            ),
          ),
          UserProfileName(
            name: widget.profile.name,
            age: widget.profile.age,
            tag: widget.profile.tag,
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 16.0,
            ),
          ),
          Interests(
            interests: widget.profile.interests,
            displayAmount: widget.profile.interests.length,
          ),
        ],
      ),
    );
  }
}
