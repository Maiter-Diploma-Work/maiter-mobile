import 'package:amica/src/data/valery_doe.dart';
import 'package:amica/src/layouts/scaffold.dart';
import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/screens/events/event_create/event_create.dart';
import 'package:amica/src/screens/events/event_details/event_details.dart';
import 'package:amica/src/screens/events/event_search.dart';
import 'package:amica/src/screens/events/event_search_filter/event_search_filter.dart';
import 'package:amica/src/services/event/mock_event.service.dart';
import 'package:amica/src/services/profile/mock_profile.service.dart';
import 'package:amica/src/services/user/mock_user_search.service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final eventsRouter = GoRoute(
  path: '/events',
  builder: (context, state) => AmicaScaffold(
    actions: [
      IconButton(
        icon: const Icon(Icons.create),
        onPressed: () => context.go('/events/create'),
      ),
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => context.go('/events/filter'),
      ),
    ],
    title: 'Events',
    isDetailed: false,
    scaffoldBody: EventSearchView(
      user: MockProfileService.instance.userProfile!,
      eventService: MockEventService.instance,
    ),
    selectedNavigationItemIndex: 1,
  ),
  routes: [
    GoRoute(
      path: 'filter',
      builder: (context, state) => AmicaScaffold(
        title: 'events filter',
        scaffoldBody: EventSearchFilter(
          profile: MockProfileService.instance.userProfile!,
          eventService: MockEventService.instance,
        ),
        selectedNavigationItemIndex: 1,
        isDetailed: false,
        hasBlurOnAppBar: true,
      ),
    ),
    GoRoute(
      path: 'detailed',
      builder: (context, state) {
        Event event = state.extra as Event;
        return AmicaScaffold(
          title: event.name,
          scaffoldBody: EventDetailsView(
            event: event,
            profileService: MockProfileService.instance,
            userSearchService: MockedUserSearchService.instance,
          ),
          selectedNavigationItemIndex: 1,
          isDetailed: true,
          hasBlurOnAppBar: true,
          appBarElevation: 0,
          appBarShape: const Border(bottom: BorderSide.none),
        );
      },
    ),
    GoRoute(
      path: 'create',
      builder: (context, state) => AmicaScaffold(
        title: 'Create event',
        scaffoldBody: EventCreate(
          profileService: MockProfileService.instance,
          eventService: MockEventService.instance,
        ),
        selectedNavigationItemIndex: 1,
        isDetailed: false,
        hasBlurOnAppBar: true,
      ),
    )
  ],
);
