import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  late int id;
  late String? postcode;
  late String name;
  late String countryName;
  late double longitude;
  late double latitude;

  Location({
    this.postcode,
    required this.name,
    required this.id,
    required this.countryName,
    required this.longitude,
    required this.latitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        postcode: json["postcode"],
        name: json["name"],
        countryName: json["countryName"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "postcode": postcode,
        "name": name,
        "countryName": countryName,
        "longitude": longitude,
        "latitude": latitude,
      };
}
