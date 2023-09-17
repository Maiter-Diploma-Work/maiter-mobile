import 'dart:convert';

DislikeDto dislikeDtoFromJson(String str) => DislikeDto.fromJson(json.decode(str));

String dislikeDtoToJson(DislikeDto data) => json.encode(data.toJson());

List<DislikeDto> dislikesDtoFromJson(String str) =>
    List<DislikeDto>.from(json.decode(str).map((x) => DislikeDto.fromJson(x)));

String dislikesDtoToJson(List<DislikeDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DislikeDto {
  int id;
  int firstUserId;
  int secondUserId;

  DislikeDto({
    required this.id,
    required this.firstUserId,
    required this.secondUserId,
  });

  factory DislikeDto.fromJson(Map<String, dynamic> json) => DislikeDto(
        id: json["id"],
        firstUserId: json["firstUserId"],
        secondUserId: json["secondUserId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstUserId": firstUserId,
        "secondUserId": secondUserId,
      };
}
