class Location {
  int id;
  int postcode;
  String name;
  String countryName;
  double? latitude;
  double? longitude;

  Location(this.postcode, 
           this.name, 
           this.id, 
           this.countryName, 
           this.latitude,
           this.longitude);
}
