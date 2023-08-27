import 'dart:convert';

LikeDto likeDtoFromJson(String str) => LikeDto.fromJson(json.decode(str));

String likeDtoToJson(LikeDto data) => json.encode(data.toJson());

List<LikeDto> likesDtoFromJson(String str) =>
    List<LikeDto>.from(json.decode(str).map((x) => LikeDto.fromJson(x)));

String likesDtoToJson(List<LikeDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LikeDto {
  int id;
  int firstUserId;
  int secondUserId;

  LikeDto({
    required this.id,
    required this.firstUserId,
    required this.secondUserId,
  });

  factory LikeDto.fromJson(Map<String, dynamic> json) => LikeDto(
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
