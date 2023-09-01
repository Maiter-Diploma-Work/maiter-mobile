import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:amica/src/models/profiles/expectancies.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/models/shared/location.dart';
import 'package:amica/src/models/shared/social_network.dart';
import 'package:amica/src/shared/character_traits/character_traits.dart';
import 'package:amica/src/shared/title.dart';
import 'package:amica/src/screens/user_search_profile_view/user_profile_detailed_view/character_trait_view.dart';
import 'package:amica/src/shared/delimeter.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/profile/description.dart';
import 'package:amica/src/shared/profile/interests.dart';
import 'package:amica/src/shared/profile/location.dart';
import 'package:amica/src/shared/profile/user_profile_name.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserProfileDetailed extends StatefulWidget {
  final UserProfile profile;
  final bool? isOwnProfile;

  const UserProfileDetailed({
    super.key,
    required this.profile,
    this.isOwnProfile,
  });

  @override
  State<StatefulWidget> createState() => _UserProfileDetailedState();
}

class _UserProfileDetailedState extends State<UserProfileDetailed> {
  final List<String> assetImages = [
    'assets/valery_doe.jpg',
    'assets/valery_doe_1.jpg',
    'assets/valery_doe_2.jpg',
    'assets/valery_doe_3.jpg',
    'assets/valery_doe_4.jpg',
  ];

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

  Widget textGenerator(
    String text, [
    FontWeight? fontWeight,
    double? fontSize,
  ]) {
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
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            _generateBasicInfo(),
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                left: 50,
                right: 50,
                bottom: 52,
              ),
              child: Column(
                children: [
                  editButton,
                  const Gap.cubic(26),
                  Interests(
                    interests: widget.profile.interests,
                  ),
                  const Gap.cubic(26),
                  generateAdditionalInfo(context),
                  const Gap.cubic(26),
                  expectancies,
                  const Gap.cubic(26),
                  CharacterTraits(
                    characterTraits: widget.profile.characterTraits,
                    isEditable: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get editButton {
    if (widget.isOwnProfile != null && widget.isOwnProfile!) {
      return Column(
        children: [
          const Gap(verticalGap: 16, horizontalGap: 0),
          AmicaButton(
            color: Theme.of(context).colorScheme.primary,
            onPressed: () => context.go('/profile/edit-menu'),
            text: 'Edit profile',
          ),
        ],
      );
    }

    return Container();
  }

  Widget _generateBasicInfo() {
    return Stack(
      children: [
        CarouselSlider(
          items: _carouselElemenets,
          options: CarouselOptions(
            height: 600,
            enlargeCenterPage: false,
          ),
        ),
        Positioned.fill(
          bottom: 0,
          left: 72,
          right: 72,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LocationView(location: widget.profile.location),
              UserProfileName.fromProfile(
                widget.profile,
                padding: const EdgeInsets.symmetric(vertical: 7.0),
              ),
            ],
          ),
        )
      ],
    );
  }

  List<Widget> get _carouselElemenets {
    if (widget.profile.photos == null) {
      return [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          child: Image.asset(widget.profile.photo, fit: BoxFit.contain),
        ),
      ];
    }

    return List.from(
      widget.profile.photos!.map(
        (e) => ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          child: Image.asset(e, fit: BoxFit.contain),
        ),
      ),
    );
  }

  Widget generateAdditionalInfo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // location,
        // const Delimeter(
        //   bottomMargin: 12,
        //   topMargin: 2,
        // ),
        socialNetworks,
        generateDelimeter(widget.profile.socialNetworks != null),
        //Should it even be?
        education,
        generateDelimeter(widget.profile.education != null),
        ProfileDescription(
          description: widget.profile.description,
        ),
        const Gap(
          verticalGap: 46,
          horizontalGap: 0,
        ),
      ],
    );
  }

  Widget generateDelimeter(bool shouldRender) {
    if (!shouldRender) return Container();

    return const Delimeter(
      bottomMargin: 12,
      topMargin: 4,
    );
  }

  Widget get expectancies {
    List<Expectancy> expectancies = widget.profile.expectancies;

    if (expectancies.isEmpty) {
      return Container();
    }

    return Column(
      children: [
        const AmicaTitle(text: 'Expectations'),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.from(
            expectancies.map(
              (e) => Row(
                children: [
                  const Icon(Icons.chevron_right),
                  Text(
                    e.text,
                    style: const TextStyle(
                      fontSize: 18.0,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget get education {
    String? education = widget.profile.education;
    if (education == null) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          education,
          style: const TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
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
    final List<SocialNetwork>? socialNetworks = widget.profile.socialNetworks;
    if (socialNetworks == null) return Container();

    List<Widget> networks = List.generate(
      socialNetworks.length,
      (index) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap.cubic(16),
          textGenerator(
            '- ${socialNetworks[index].name}:',
            FontWeight.w500,
          ),
          const Gap(verticalGap: 0, horizontalGap: 14.0),
          textGenerator(
            socialNetworks[index].userName,
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
          // const Align(
          //   alignment: Alignment.centerLeft,
          //   child: CircleAvatar(
          //     radius: 75,
          //     backgroundImage: AssetImage('assets/valery_doe.jpg'),
          //   ),
          // ),
          UserProfileName.fromProfile(
            widget.profile,
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
