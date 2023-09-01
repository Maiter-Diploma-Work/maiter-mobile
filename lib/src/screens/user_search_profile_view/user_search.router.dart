import 'package:amica/src/data/valery_doe.dart';
import 'package:amica/src/layouts/scaffold.dart';
import 'package:amica/src/screens/user_search_profile_view/user_search_filter/user_search_filter.dart';
import 'package:amica/src/screens/user_search_profile_view/likes_view/likes_view.dart';
import 'package:amica/src/screens/user_search_profile_view/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'user_profile_detailed_view/user_profile_detailed.dart';

final searchUserRouter = GoRoute(
  path: '/search/user',
  builder: (context, state) => AmicaScaffold(
    title: "User Search",
    scaffoldBody: UserProfileView(
      profile: ValeryDoe,
    ),
    selectedNavigationItemIndex: 0,
    isDetailed: false,
    actions: [
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => context.go('/search/user/filter'),
      ),
      IconButton(
        icon: const Icon(Icons.favorite),
        onPressed: () => context.go('/search/user/liked'),
      ),
    ],
  ),
  routes: [
    GoRoute(
      path: 'details',
      builder: (context, state) => AmicaScaffold(
        isDetailed: true,
        hasBlurOnAppBar: false,
        title: "",
        scaffoldBody: UserProfileDetailed(
          profile: ValeryDoe,
        ),
        selectedNavigationItemIndex: 0,
      ),
    ),
    GoRoute(
      path: 'filter',
      builder: (context, state) => AmicaScaffold(
        title: 'search filter',
        scaffoldBody: UserSearchFilter(
          profile: ValeryDoe,
        ),
        selectedNavigationItemIndex: 0,
        isDetailed: true,
        hasBlurOnAppBar: true,
      ),
    ),
    GoRoute(
      path: 'liked',
      builder: (context, state) => AmicaScaffold(
        title: 'likes',
        scaffoldBody: AmicaLikesView(
          userId: ValeryDoe.id,
        ),
        selectedNavigationItemIndex: 0,
        isDetailed: false,
        hasBlurOnAppBar: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => context.go('/search/user/filter'),
          ),
        ],
      ),
    )
  ],
);
