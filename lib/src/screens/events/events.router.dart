import 'package:amica/src/data/valery_doe.dart';
import 'package:amica/src/layouts/scaffold.dart';
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
  ],
);
