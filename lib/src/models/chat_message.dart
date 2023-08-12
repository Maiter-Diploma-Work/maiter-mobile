import 'dart:convert';

List<ChatMessage> chatMessagesFromJson(String str) => List<ChatMessage>.from(
    json.decode(str).map((x) => ChatMessage.fromJson(x)));
ChatMessage chatMessageFromJson(String str) =>
    ChatMessage.fromJson(json.decode(str));

String chatMessageToJson(List<ChatMessage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatMessage {
  int id;
  int userId;
  String text;

  ChatMessage({
    required this.id,
    required this.userId,
    required this.text,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json["id"],
        userId: json["userId"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "text": text,
      };
}
