import 'package:amica/src/layouts/scaffold.dart';
import 'package:amica/src/screens/chat/chat-list/chat-list.dart';
import 'package:amica/src/screens/chat/chat.dart';
import 'package:amica/src/screens/chat/chat_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final chatRouter = [
  GoRoute(
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
  ),
  GoRoute(
    path: '/chat/:user_id',
    builder: (context, state) => AmicaScaffold(
      title: '',
      scaffoldAppBarTitle: ChatAppBarTitle(
        userId: state.pathParameters['user_id']!,
      ),
      scaffoldBody: ChatView(
        userId: state.pathParameters['user_id']!,
      ),
      selectedNavigationItemIndex: 2,
      isDetailed: false,
      appBarBackgroundColor: Theme.of(context).colorScheme.inverseSurface,
      appBarForegroundColor: Theme.of(context).colorScheme.onInverseSurface,
    ),
    routes: [
      GoRoute(
        path: 'details',
        builder: (context, state) => const AmicaScaffold(
          title: '',
          scaffoldBody: Placeholder(),
          selectedNavigationItemIndex: 2,
          isDetailed: true,
        ),
      ),
    ],
  ),
];
