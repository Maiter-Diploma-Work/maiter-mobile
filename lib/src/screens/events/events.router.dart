import 'package:amica/src/data/valery_doe.dart';
import 'package:amica/src/screens/events/event_search.dart';
import 'package:go_router/go_router.dart';

final eventsRouter = <GoRoute>[
  GoRoute(
    path: '/events',
    builder: (context, state) => EventSearchView(
      user: ValeryDoe,
    ),
  ),
];
