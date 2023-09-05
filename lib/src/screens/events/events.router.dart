import 'package:amica/src/data/valery_doe.dart';
import 'package:amica/src/layouts/scaffold.dart';
import 'package:amica/src/models/profiles/event.dart';
import 'package:amica/src/screens/events/event_create/event_create.dart';
import 'package:amica/src/screens/events/event_details/event_details.dart';
import 'package:amica/src/screens/events/event_search.dart';
import 'package:amica/src/screens/events/event_search_filter/event_search_filter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final eventsRouter = GoRoute(
  path: '/events',
  builder: (context, state) => AmicaScaffold(
    actions: [
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => context.go('/events/filter'),
      ),
    ],
    title: 'events',
    isDetailed: false,
    scaffoldBody: EventSearchView(
      user: ValeryDoe,
    ),
    selectedNavigationItemIndex: 1,
  ),
  routes: [
    GoRoute(
      path: 'filter',
      builder: (context, state) => AmicaScaffold(
        title: 'events filter',
        scaffoldBody: EventSearchFilter(
          lookingFor: ValeryDoe.lookingFor,
        ),
        selectedNavigationItemIndex: 1,
        isDetailed: true,
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
            userLocation: ValeryDoe.location,
          ),
          selectedNavigationItemIndex: 1,
          isDetailed: true,
          hasBlurOnAppBar: true,
        );
      },
    ),
    GoRoute(
      path: 'create',
      builder: (context, state) => AmicaScaffold(
        title: 'Create event',
        scaffoldBody: EventCreate(profileLocation: ValeryDoe.location),
        selectedNavigationItemIndex: 1,
        isDetailed: false,
        hasBlurOnAppBar: true,
      ),
    )
  ],
);
