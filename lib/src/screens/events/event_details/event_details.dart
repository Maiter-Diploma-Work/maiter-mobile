import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/profile/profile.service.dart';
import 'package:amica/src/services/user/user_search.service.dart';
import 'package:amica/src/shared/gap.dart';
import 'package:amica/src/shared/maps/static_google_maps.dart';
import 'package:amica/src/shared/profile/profile_picture.dart';
import 'package:amica/src/shared/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetailsView extends StatefulWidget {
  final ProfileService profileService;
  final Event event;
  final UserSearchService userSearchService;

  const EventDetailsView({
    super.key,
    required this.event,
    required this.profileService,
    required this.userSearchService,
  });

  @override
  State<EventDetailsView> createState() => _EventDetailsViewState();
}

class _EventDetailsViewState extends State<EventDetailsView> {
  late UserProfile creatorProfile;

  Widget _details(BuildContext context) {
    return Row(
      children: [
        _leftDetailsScreen(context),
        const Gap(verticalGap: 0, horizontalGap: 16),
        _rightDetailsSection(context),
      ],
    );
  }

  Widget _leftDetailsScreen(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AmicaTitle(
              text: '${widget.event.name} has created an event',
              fontStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(verticalGap: 6, horizontalGap: 0),
            Text('${widget.event.description}'),
          ],
        ),
      ),
    );
  }

  Widget _rightDetailsSection(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/search/details', extra: creatorProfile),
      child: ProfilePicture(
        pictureUrl: widget.event.photo,
        isRound: true,
        radius: 64,
      ),
    );
  }

  void _navigateToCreatorDetails() async {
    creatorProfile = await widget.userSearchService
        .getUser(widget.event.creatorId.toString());
  }

  @override
  void initState() {
    super.initState();
    _navigateToCreatorDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AmicaStaticGoogleMaps(
          location: LatLng(
            widget.profileService.userProfile!.location.latitude,
            widget.profileService.userProfile!.location.longitude,
          ),
          destination: LatLng(
            widget.event.location.latitude,
            widget.event.location.longitude,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              color: Theme.of(context).colorScheme.background,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: _details(context),
          ),
        )
      ],
    );
  }
}
