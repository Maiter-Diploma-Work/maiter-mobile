import 'dart:convert';

List<ChatRoomDTO> chatRoomDTOsFromJson(String str) => List<ChatRoomDTO>.from(
    json.decode(str).map((x) => ChatRoomDTO.fromJson(x)));

String chatRoomDTOsToJson(List<ChatRoomDTO> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

ChatRoomDTO chatRoomDTOFromJson(String str) =>
    ChatRoomDTO.fromJson(json.decode(str));

String chatRoomDTOToJson(ChatRoomDTO data) => json.encode(data.toJson());

class ChatRoomDTO {
  final int id;
  final List<int> participantIds;
  final String lastMessageSentAt;

  ChatRoomDTO({
    required this.id,
    required this.participantIds,
    required this.lastMessageSentAt,
  });

  factory ChatRoomDTO.fromJson(Map<String, dynamic> json) => ChatRoomDTO(
        id: json["id"],
        participantIds: List<int>.from(json["participantIds"].map((x) => x)),
        lastMessageSentAt: json["lastMessageSentAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "participantIds": List<dynamic>.from(participantIds.map((x) => x)),
        "lastMessageSentAt": lastMessageSentAt,
      };
}
