import 'dart:core';

import 'package:amica/src/models/DTO/chat/chat_room_dto.dart';
import 'package:amica/src/models/chat/chat_room.dart';
import 'package:amica/src/models/chat/chat_user_short_profile.dart';
import 'package:amica/src/models/profiles/user_profile.dart';
import 'package:amica/src/services/chat/room/room.service.dart';
import 'package:amica/src/services/profile/mock_profile.service.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MockChatRoomService extends ChatRoomService {
  static MockChatRoomService? _instance;
  final UserProfile _currentUser = MockProfileService.instance.userProfile!;

  static MockChatRoomService get instance {
    _instance ??= MockChatRoomService();

    return _instance!;
  }

  List<ChatUserShortProfile> parseParticipants(
    List<int> userIds,
    List<UserProfile> userData,
  ) {
    return List.from(
      userIds.map((x) {
        if (x == _currentUser.id) {
          return ChatUserShortProfile(
            id: x,
            name: _currentUser.name,
            photo: _currentUser.photo,
          );
        }
        print('the X is $x');
        UserProfile user = userData.firstWhere((element) => element.id == x);
        return ChatUserShortProfile(
          id: user.id,
          name: user.name,
          photo: user.photo,
        );
      }),
    );
  }

  List<ChatRoom> parseChatRooms(
    String userId,
    List<ChatRoomDTO> chatRoomData,
    List<UserProfile> userData,
  ) {
    List<ChatRoom> result = [];

    for (ChatRoomDTO dto in chatRoomData) {
      if (dto.participantIds.contains(int.parse(userId))) {
        result.add(ChatRoom(
          id: dto.id,
          participants: parseParticipants(dto.participantIds, userData),
          lastMessageSentAt: DateFormat.yMd().parse(dto.lastMessageSentAt),
        ));
      }
    }

    return result;
  }

  @override
  Future<List<ChatRoom>> getChatRoomsFor(
    String userId,
    ChatRoomType chatRoomType,
  ) async {
    String chatRoomsResponse;

    switch (chatRoomType) {
      case ChatRoomType.pinned:
        chatRoomsResponse = await rootBundle
            .loadString('assets/mock-data/mock_pinned_chat_rooms.json');
        break;

      case ChatRoomType.plain:
      default:
        chatRoomsResponse = await rootBundle
            .loadString('assets/mock-data/mock_chat_rooms.json');
        break;
    }

    final String usersResponse =
        await rootBundle.loadString('assets/mock-data/mock_users.json');

    List<UserProfile> userData = usersFromJson(usersResponse);
    List<ChatRoomDTO> chatRoomData = chatRoomDTOsFromJson(chatRoomsResponse);

    return parseChatRooms(userId, chatRoomData, userData);
  }
}
