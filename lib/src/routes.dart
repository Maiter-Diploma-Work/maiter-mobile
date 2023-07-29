import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maiter/src/data/valery_doe.dart';
import 'package:maiter/src/layouts/scaffold.dart';
import 'package:maiter/src/screens/auth/login/login.dart';
import 'package:maiter/src/screens/auth/register/register.dart';
import 'package:maiter/src/screens/chat/chat-list.dart';
import 'package:maiter/src/screens/chat/chat.dart';
import 'package:maiter/src/screens/chat/chat_app_bar_title.dart';
import 'package:maiter/src/screens/option_select_view/option_select_item.dart';
import 'package:maiter/src/screens/option_select_view/option_select_view.dart';
import 'package:maiter/src/screens/profile_view/profile_edit_view/profile_edit_view.dart';
import 'package:maiter/src/screens/profile_view/profile_view.dart';
import 'package:maiter/src/screens/user_profile_detailed_view/user_profile_detailed.dart';
import 'package:maiter/src/screens/user_profile_view/user_profile_view.dart';
import 'package:maiter/src/screens/welcome_view/welcome_view.dart';

//TODO: State management

final searchUser = GoRoute(
  path: 'search/user',
  builder: (context, state) => MaiterScaffold(
    title: "User Search",
    scaffoldBody: UserProfileView(
      profile: ValeryDoe,
    ),
    selectedNavigationItemIndex: 0,
    isDetailed: false,
  ),
  routes: [
    GoRoute(
      path: 'details',
      builder: (context, state) => MaiterScaffold(
        isDetailed: true,
        title: "",
        scaffoldBody: UserProfileDetailed(
          profile: ValeryDoe,
        ),
        selectedNavigationItemIndex: 0,
      ),
    ),
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
  path: 'profile',
  builder: (context, state) => MaiterScaffold(
    title: 'Your Profile',
    scaffoldBody: ProfileView(profile: ValeryDoe),
    selectedNavigationItemIndex: 3,
    isDetailed: false,
  ),
  routes: [
    GoRoute(
      path: 'edit',
      builder: (context, state) => MaiterScaffold(
        isDetailed: true,
        title: 'Edit Profile',
        scaffoldBody: ProfileEditView(profile: ValeryDoe),
        selectedNavigationItemIndex: 3,
      ),
    ),
    //TODO: remove the hardcode
    GoRoute(
      path: 'theme',
      builder: (context, state) => MaiterScaffold(
        isDetailed: true,
        selectedNavigationItemIndex: 3,
        title: 'Theme selection',
        scaffoldBody: OptionSelect(
          options: [
            OptionSelectItem("light"),
            OptionSelectItem("dark"),
            OptionSelectItem("summer"),
            OptionSelectItem("fall"),
            OptionSelectItem("winter"),
            OptionSelectItem("spring"),
          ],
        ),
      ),
    ),
    GoRoute(
      path: 'language',
      builder: (context, state) => MaiterScaffold(
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
);

final chat = GoRoute(
  path: 'chat-list',
  builder: (context, state) => const MaiterScaffold(
    title: 'Chats',
    scaffoldBody: ChatListView(
      chats: [],
    ),
    selectedNavigationItemIndex: 2,
    isDetailed: false,
  ),
  routes: [
    GoRoute(
      path: ':user_id',
      builder: (context, state) => MaiterScaffold(
        title: '',
        scaffoldAppBarTitle:
            ChatAppBarTitle(userId: state.pathParameters['user_id']!),
        scaffoldBody: ChatView(
          userId: state.pathParameters['user_id']!,
        ),
        selectedNavigationItemIndex: 2,
        isDetailed: false,
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
        searchUser,
        chat,
        profile,
      ],
    ),
  ],
);
