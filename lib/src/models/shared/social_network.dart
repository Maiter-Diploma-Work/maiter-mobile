import 'dart:convert';

SocialNetwork socialNetworkFromJson(String str) =>
    SocialNetwork.fromJson(json.decode(str));

List<SocialNetwork> socialNetworksFromJson(List<dynamic> str) =>
    List<SocialNetwork>.from(str.map((x) => SocialNetwork.fromJson(x)));

String socialNetworkToJson(SocialNetwork data) => json.encode(data.toJson());

class SocialNetwork {
  int id;
  int userId;
  String name;
  String userName;

  SocialNetwork({
    required this.id,
    required this.userId,
    required this.name,
    required this.userName,
  });

  factory SocialNetwork.fromJson(Map<String, dynamic> json) => SocialNetwork(
        id: json["id"],
        userId: json["userId"],
        name: json["name"],
        userName: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "name": name,
        "userName": userName,
      };
}
