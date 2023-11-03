import 'package:amica/src/models/profiles/expectancies.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/models/shared/location.dart';
import 'package:amica/src/models/shared/social_network.dart';
import 'package:amica/src/shared/character_traits/character_traits.dart';
import 'package:amica/src/shared/delimeter.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/inputs/amica_button.dart';
import 'package:amica/src/shared/profile/description.dart';
import 'package:amica/src/shared/profile/interests.dart';
import 'package:amica/src/shared/profile/location.dart';
import 'package:amica/src/shared/profile/profile_picture.dart';
import 'package:amica/src/shared/profile/user_profile_name.dart';
import 'package:amica/src/shared/title.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class UserProfileDetailed extends StatelessWidget {
  final UserProfile profile;
  final bool? isOwnProfile;

  const UserProfileDetailed({
    super.key,
    required this.profile,
    this.isOwnProfile,
  });

  void onDrag(DragUpdateDetails details, BuildContext context) {
    int sensitivity = 8;
    if (details.delta.dx > sensitivity) {
      context.go('/search');
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
          children: [
            _carouselElemenets.length > 1
                ? CarouselSlider(
                    items: _carouselElemenets,
                    options: CarouselOptions(
                      height: 512,
                      enlargeCenterPage: true,
                    ),
                  )
                : ProfilePicture(
                    pictureUrl: profile.photo,
                    borderRadius: 16,
                  ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                bottom: 52,
              ),
              child: Column(
                children: [
                  UserProfileName.fromProfile(
                    profile,
                    padding: const EdgeInsets.symmetric(vertical: 7.0),
                  ),
                  LocationView(location: profile.location),
                  generateDelimeter(profile.socialNetworks != null),
                  getEditButton(context),
                  Interests(
                    interests: profile.interests,
                  ),
                  const Gap.cubic(26),
                  generateAdditionalInfo(context),
                  const Gap.cubic(26),
                  getExpectancies(context),
                  const Gap.cubic(26),
                  CharacterTraits(
                    isEditable: false,
                    controller: FormArray(
                      List.from(
                        profile.characterTraits.map(
                          (characterTrait) => FormControl(
                            value: characterTrait,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getEditButton(BuildContext context) {
    if (isOwnProfile != null && isOwnProfile!) {
      return Column(
        children: [
          const Gap(verticalGap: 16, horizontalGap: 0),
          AmicaButton(
            color: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.onPrimary,
            onPressed: () => context.go('/profile/edit-menu'),
            text: 'Edit profile',
          ),
          const Gap.cubic(26),
        ],
      );
    }

    return Container();
  }

  List<Widget> get _carouselElemenets {
    if (profile.photos == null) {
      return [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          child: Image.asset(profile.photo, fit: BoxFit.contain),
        ),
      ];
    }

    return List.from(
      profile.photos!.map(
        (e) => ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          child: ProfilePicture(pictureUrl: e, borderRadius: 16),
        ),
      ),
    );
  }

  Widget generateAdditionalInfo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        socialNetworks,
        generateDelimeter(profile.socialNetworks != null),
        education,
        generateDelimeter(profile.education != null),
        ProfileDescription(
          description: profile.description,
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

  Widget getExpectancies(BuildContext context) {
    List<Expectancy> expectancies = profile.expectancies;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: RichText(
                      text: TextSpan(children: [
                        const WidgetSpan(
                          child: Icon(Icons.chevron_right),
                        ),
                        TextSpan(
                          text: e.text,
                          style: TextStyle(
                            fontSize: 18.0,
                            height: 2,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ]),
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
    String? education = profile.education;
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
    final Location tmp = profile.location;
    String location = "${tmp.countryName}, ${tmp.name}";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textGenerator(location),
      ],
    );
  }

  Widget get socialNetworks {
    final List<SocialNetwork>? socialNetworks = profile.socialNetworks;
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
}
