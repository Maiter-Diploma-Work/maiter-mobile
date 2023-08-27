import 'package:amica/src/data/valery_doe.dart';
import 'package:amica/src/layouts/scaffold.dart';
import 'package:amica/src/screens/auth/login/login.dart';
import 'package:amica/src/screens/auth/register/register.dart';
import 'package:amica/src/screens/chat/chat-list.dart';
import 'package:amica/src/screens/chat/chat.dart';
import 'package:amica/src/screens/chat/chat_app_bar_title.dart';
import 'package:amica/src/screens/filters/user_search_filter/user_search_filter.dart';
import 'package:amica/src/screens/interests_list/interests_list.dart';
import 'package:amica/src/screens/likes_view/likes_view.dart';
import 'package:amica/src/screens/option_select_view/option_select_item.dart';
import 'package:amica/src/screens/option_select_view/option_select_view.dart';
import 'package:amica/src/screens/profile_view/profile_edit_view/profile_edit_view.dart';
import 'package:amica/src/screens/profile_view/profile_photo_edit_view/profile_photo_edit_view.dart';
import 'package:amica/src/screens/profile_view/profile_view.dart';
import 'package:amica/src/screens/user_profile_detailed_view/user_profile_detailed.dart';
import 'package:amica/src/screens/user_profile_view/user_profile_view.dart';
import 'package:amica/src/screens/welcome_view/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//TODO: State management?

final searchUser = GoRoute(
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
        title: 'filter',
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

final login = GoRoute(
  path: 'auth/login',
  builder: (context, state) => const LoginScreen(),
);
final register = GoRoute(
  path: 'auth/register',
  builder: (context, state) => const RegisterScreen(),
);

final profile = GoRoute(
  path: '/profile',
  builder: (context, state) => AmicaScaffold(
    title: 'Your Profile',
    scaffoldBody: UserProfileDetailed(profile: ValeryDoe, isOwnProfile: true),
    selectedNavigationItemIndex: 3,
    isDetailed: false,
  ),
  routes: [
    GoRoute(
      path: 'edit-menu',
      builder: (context, state) => AmicaScaffold(
        hasBlurOnAppBar: true,
        isDetailed: true,
        title: 'Edit Profile',
        scaffoldBody: ProfileView(profile: ValeryDoe),
        selectedNavigationItemIndex: 3,
      ),
      routes: [
        GoRoute(
          path: 'edit',
          builder: (context, state) => AmicaScaffold(
            hasBlurOnAppBar: true,
            isDetailed: true,
            title: 'Edit Profile',
            scaffoldBody: ProfileEditView(profile: ValeryDoe),
            selectedNavigationItemIndex: 3,
          ),
        ),
        GoRoute(
          path: 'interests',
          builder: (context, state) => AmicaScaffold(
            hasBlurOnAppBar: true,
            isDetailed: true,
            title: 'Edit interests',
            scaffoldBody: InterestsListSelect(
              selectedInterests: ValeryDoe.interests,
              isRegistrations: false,
            ),
            selectedNavigationItemIndex: 3,
          ),
        ),
        GoRoute(
          path: 'photos',
          builder: (context, state) => AmicaScaffold(
            hasBlurOnAppBar: true,
            isDetailed: true,
            title: 'Edit Profile',
            scaffoldBody: ProfilePhotoEditView(userProfile: ValeryDoe),
            selectedNavigationItemIndex: 3,
          ),
        ),
        GoRoute(
          path: 'theme',
          builder: (context, state) => AmicaScaffold(
            hasBlurOnAppBar: true,
            isDetailed: true,
            selectedNavigationItemIndex: 3,
            title: 'Theme selection',
            scaffoldBody: OptionSelect(
              options: [
                OptionSelectItem("light"),
                OptionSelectItem("dark"),
              ],
            ),
          ),
        ),
        GoRoute(
          path: 'language',
          builder: (context, state) => AmicaScaffold(
            hasBlurOnAppBar: true,
            isDetailed: true,
            selectedNavigationItemIndex: 3,
            title: 'Language selection',
            scaffoldBody: OptionSelect(
              options: [
                OptionSelectItem("English"),
                OptionSelectItem("Українська"),
              ],
            ),
          ),
        ),
      ],
    ),
  ],
);

final chat = GoRoute(
  path: '/chat-list',
  builder: (context, state) => const AmicaScaffold(
    title: 'Chats',
    scaffoldBody: ChatListView(
      chats: [],
    ),
    selectedNavigationItemIndex: 2,
    isDetailed: false,
    appBarBackgroundColor: Color(0xFF080D20),
  ),
  routes: [
    GoRoute(
      path: ':user_id',
      builder: (context, state) => AmicaScaffold(
        title: '',
        scaffoldAppBarTitle:
            ChatAppBarTitle(userId: state.pathParameters['user_id']!),
        scaffoldBody: ChatView(
          userId: state.pathParameters['user_id']!,
        ),
        selectedNavigationItemIndex: 2,
        isDetailed: false,
        appBarBackgroundColor: Theme.of(context).colorScheme.inverseSurface,
        appBarForegroundColor: Theme.of(context).colorScheme.onInverseSurface,
      ),
    )
  ],
);

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
      routes: [
        login,
        register,
      ],
    ),
    searchUser,
    chat,
    profile,
  ],
);
