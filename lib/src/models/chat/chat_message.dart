import 'dart:convert';

ChatMessage chatMessageFromJson(String str) =>
    ChatMessage.fromJson(json.decode(str));

String chatMessageToJson(ChatMessage data) => json.encode(data.toJson());

ChatMessage chatMessagesFromJson(String str) =>
    ChatMessage.fromJson(json.decode(str));

String chatMessagesToJson(ChatMessage data) => json.encode(data.toJson());

class ChatMessage {
  int id;
  int chatroomId;
  int creatorId;
  String content;
  bool beenRedacted;
  String type;
  String sentAt;

  ChatMessage({
    required this.id,
    required this.chatroomId,
    required this.creatorId,
    required this.content,
    required this.beenRedacted,
    required this.type,
    required this.sentAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
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
