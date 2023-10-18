import 'package:amica/src/layouts/scaffold.dart';
import 'package:amica/src/screens/chat/chat-list/chat-list.dart';
import 'package:amica/src/screens/chat/chat.dart';
import 'package:amica/src/screens/chat/chat_app_bar_title.dart';
import 'package:amica/src/screens/chat/chat_detailed_profile/chat_detailed_profile.dart';
import 'package:amica/src/services/chat/message/mock_message.service.dart';
import 'package:amica/src/services/chat/room/mock_room.service.dart';
import 'package:amica/src/services/profile/mock_profile.service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final chatRouter = [
  GoRoute(
    path: '/chat',
    builder: (context, state) => AmicaScaffold(
      title: 'Chats',
      scaffoldBody: ChatListView(
        profileService: MockProfileService.instance,
        chatRoomService: MockChatRoomService.instance,
      ),
      selectedNavigationItemIndex: 2,
      isDetailed: false,
      appBarBackgroundColor: Color(0xFF080D20),
    ),
    routes: [
      GoRoute(
        path: ':user_id/:chat_room_id',
        builder: (context, state) => AmicaScaffold(
          title: '',
          scaffoldAppBarTitle: ChatAppBarTitle(
            userId: state.pathParameters['user_id']!,
          ),
          scaffoldBody: ChatView(
            messageService: MockMessageService.instance,
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
            ),
          ),
        ],
      ),
    ],
  ),
];
