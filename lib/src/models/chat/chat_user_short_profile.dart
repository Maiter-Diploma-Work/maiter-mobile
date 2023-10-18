import 'dart:convert';

ChatUserShortProfile ChatUserShortProfileFromJson(String str) =>
    ChatUserShortProfile.fromJson(json.decode(str));

String ChatUserShortProfileToJson(ChatUserShortProfile data) =>
    json.encode(data.toJson());

List<ChatUserShortProfile> chatUserShortProfileFromJson(String str) =>
    List<ChatUserShortProfile>.from(
        json.decode(str).map((x) => ChatUserShortProfile.fromJson(x)));

String chatUserShortProfileToJson(List<ChatUserShortProfile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatUserShortProfile {
  int id;
  String name;
  String photo;

  ChatUserShortProfile({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory ChatUserShortProfile.fromJson(Map<String, dynamic> json) =>
      ChatUserShortProfile(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
      };
}
