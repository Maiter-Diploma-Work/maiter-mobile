import 'dart:convert';

ChatMessageDTO chatMessageDTOFromJson(String str) =>
    ChatMessageDTO.fromJson(json.decode(str));

String chatMessageDTOToJson(ChatMessageDTO data) => json.encode(data.toJson());

List<ChatMessageDTO> chatMessageDTOsFromJson(String str) =>
    List<ChatMessageDTO>.from(
        json.decode(str).map((x) => ChatMessageDTO.fromJson(x)));

String chatMessageDTOsToJson(List<ChatMessageDTO> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatMessageDTO {
  final int id;
  final int chatroomId;
  final int creatorId;
  final String content;
  final bool beenRedacted;
  final String type;
  final DateTime sentAt;

  ChatMessageDTO({
    required this.id,
    required this.chatroomId,
    required this.creatorId,
    required this.content,
    required this.beenRedacted,
    required this.type,
    required this.sentAt,
  });

  factory ChatMessageDTO.fromJson(Map<String, dynamic> json) => ChatMessageDTO(
        id: json["id"],
        chatroomId: json["chatroomId"],
        creatorId: json["creatorId"],
        content: json["content"],
        beenRedacted: json["beenRedacted"],
        type: json["type"],
        sentAt: json["sentAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chatroomId": chatroomId,
        "creatorId": creatorId,
        "content": content,
        "beenRedacted": beenRedacted,
        "type": type,
        "sentAt": sentAt,
      };
}
