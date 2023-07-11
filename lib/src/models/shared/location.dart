class Location {
  int id;
  int postcode;
  String name;
  String countryName;
  double latitude;
  double longitude;

  Location(
      {required this.postcode,
      required this.name,
      required this.id,
      required this.countryName,
      required this.latitude,
      required this.longitude});
}
