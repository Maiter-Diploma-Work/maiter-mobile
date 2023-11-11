import 'package:amica/src/layouts/scaffold.dart';
import 'package:amica/src/screens/chat/chat-list/chat-list.dart';
import 'package:amica/src/screens/chat/chat.dart';
import 'package:amica/src/screens/chat/chat_app_bar_title.dart';
import 'package:amica/src/screens/chat/chat_detailed_profile/chat_detailed_profile.dart';
import 'package:amica/src/services/service_factory.service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final chatRouter = GoRoute(
  path: '/chat',
  builder: (context, state) => AmicaScaffold(
    title: 'Chats',
    scaffoldBody: ChatListView(
      profileService: ServiceFactory.provideProfileService(),
      chatRoomService: ServiceFactory.provideChatRoomService(),
    ),
    selectedNavigationItemIndex: 2,
    isDetailed: false,
    appBarElevation: 0,
    appBarShape: const Border(bottom: BorderSide.none),
  ),
  routes: [
    GoRoute(
      path: ':user_id/:chat_room_id',
      builder: (context, state) => AmicaScaffold(
        title: '',
        scaffoldAppBarTitle: ChatAppBarTitle(
          userId: state.pathParameters['user_id']!,
          chatRoomId: state.pathParameters['chat_room_id']!,
        ),
        scaffoldBody: ChatView(
          messageService: ServiceFactory.provideMessageService(),
          profileService: ServiceFactory.provideProfileService(),
          userId: state.pathParameters['user_id']!,
          chatRoomId: state.pathParameters['chat_room_id']!,
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
            appBarElevation: 0,
            appBarShape: const Border(bottom: BorderSide.none),
            appBarBackgroundColor: Colors.transparent,
          ),
        ),
      ],
    ),
  ],
);
