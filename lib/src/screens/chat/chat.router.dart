import 'package:amica/src/layouts/scaffold.dart';
import 'package:amica/src/screens/chat/chat-list/chat-list.dart';
import 'package:amica/src/screens/chat/chat.dart';
import 'package:amica/src/screens/chat/chat_app_bar_title.dart';
import 'package:amica/src/screens/chat/chat_detailed_profile/chat_detailed_profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final chatRouter = [
  GoRoute(
    path: '/chat',
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
          scaffoldAppBarTitle: ChatAppBarTitle(
            userId: state.pathParameters['user_id']!,
          ),
          scaffoldBody: ChatView(
            userId: state.pathParameters['user_id']!,
          ),
          selectedNavigationItemIndex: 2,
          isDetailed: false,
        ),
        routes: [
          GoRoute(
            path: 'detailed',
            builder: (context, state) => AmicaScaffold(
              title: '',
              scaffoldBody: ChatDetailedProfileView(
                userId: state.pathParameters['user_id']!,
              ),
              selectedNavigationItemIndex: 2,
              isDetailed: true,
            ),
          ),
        ],
      ),
    ],
  ),
];
