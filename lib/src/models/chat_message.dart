import 'dart:convert';

import 'package:intl/intl.dart';

List<ChatMessage> chatMessagesFromJson(String str) => List<ChatMessage>.from(
    json.decode(str).map((x) => ChatMessage.fromJson(x)));
ChatMessage chatMessageFromJson(String str) =>
    ChatMessage.fromJson(json.decode(str));

String chatMessageToJson(List<ChatMessage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

enum MessageType {
  plain,
  resend,
  answer,
}

class ChatMessage {
  int id;
  int chatroomId;
  int creatorId;
  String content;
  bool beenRedacted;
  MessageType messageType;
  DateTime sentAt;

  ChatMessage({
    required this.id,
    required this.chatroomId,
    required this.creatorId,
    required this.content,
    required this.beenRedacted,
    required this.messageType,
    required this.sentAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json["id"],
        chatroomId: json["chatroomId"],
        creatorId: json['creatorId'],
        content: json["content"],
        beenRedacted: json["beenRedacted"],
        messageType: _parseMessageType(json["type"]),
        sentAt: DateFormat.yMd().parse(json['sentAt']),
      );

  static MessageType _parseMessageType(String type) {
    switch (type.toLowerCase()) {
      case 'answer':
        return MessageType.answer;
      case 'resend':
        return MessageType.resend;
      case 'plain':
      default:
        return MessageType.plain;
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "chatroomId": chatroomId,
        "creatorId": creatorId,
        "content": content,
        "beenRedacted": beenRedacted,
        "type": messageType,
        "sentAt": sentAt,
      };
}
