import 'package:amica/src/layouts/scaffold.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/screens/user_search_profile_view/likes_view/likes_view.dart';
import 'package:amica/src/screens/user_search_profile_view/user_profile_view.dart';
import 'package:amica/src/screens/user_search_profile_view/user_search_filter/user_search_filter.dart';
import 'package:amica/src/services/service_factory.service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'user_profile_detailed_view/user_profile_detailed.dart';

final searchUserRouter = GoRoute(
  path: '/search',
  builder: (context, state) => AmicaScaffold(
    title: "User Search",
    scaffoldBody: UserProfileView(
      userService: ServiceFactory.provideUserSearchService(),
      likeService: ServiceFactory.provideLikeService(),
      profileService: ServiceFactory.provideProfileService(),
    ),
    selectedNavigationItemIndex: 0,
    isDetailed: false,
    actions: [
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => context.go('/search/filter'),
      ),
      IconButton(
        icon: const Icon(Icons.favorite),
        onPressed: () => context.go('/search/liked'),
      ),
    ],
  ),
  routes: [
    GoRoute(
      path: 'details',
      builder: (context, state) {
        late UserProfile profile = state.extra as UserProfile;
        return AmicaScaffold(
          isDetailed: true,
          hasBlurOnAppBar: true,
          title: "",
          scaffoldBody: UserProfileDetailed(
            profile: profile,
          ),
          selectedNavigationItemIndex: 0,
          appBarElevation: 0,
          appBarShape: const Border(bottom: BorderSide.none),
          appBarBackgroundColor: Colors.transparent,
        );
      },
    ),
    GoRoute(
      path: 'filter',
      builder: (context, state) => AmicaScaffold(
        title: 'search filter',
        scaffoldBody: UserSearchFilter(
          profile: ServiceFactory.provideProfileService().userProfile!,
          searchService: ServiceFactory.provideUserSearchService(),
        ),
        selectedNavigationItemIndex: 0,
        isDetailed: false,
        hasBlurOnAppBar: true,
      ),
    ),
    GoRoute(
      path: 'liked',
      builder: (context, state) => AmicaScaffold(
        title: 'likes',
        scaffoldBody: AmicaLikesView(
          profileService: ServiceFactory.provideProfileService(),
          likeService: ServiceFactory.provideLikeService(),
          userService: ServiceFactory.provideUserSearchService(),
        ),
        selectedNavigationItemIndex: 0,
        isDetailed: false,
        hasBlurOnAppBar: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => context.go('/search/filter'),
          ),
        ],
      ),
    )
  ],
);
