import 'dart:convert';

import 'package:amica/src/models/DTO/chat/chat_room_dto.dart';
import 'package:amica/src/models/chat/chat_user_short_profile.dart';

String chatRoomsToJson(List<ChatRoom> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String chatRoomToJson(ChatRoom data) => json.encode(data.toJson());

class ChatRoom {
  int id;
  List<ChatUserShortProfile> participants;
  DateTime lastMessageSentAt;

  ChatRoom({
    required this.id,
    required this.participants,
    required this.lastMessageSentAt,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "participantIds": List<dynamic>.from(participants.map((x) => x.id)),
        "lastMessageSentAt": lastMessageSentAt.toString(),
      };
}
