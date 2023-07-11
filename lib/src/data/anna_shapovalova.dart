import '../models/profiles/user_profile.dart';
import '../models/shared/interest.dart';
import '../models/shared/location.dart';

final UserProfile AnnaShapovalova = UserProfile(
    id: 1,
    age: 20,
    tag: '@shapokanyutko',
    name: "Анна Шаповалова",
    description:
        "Центр чи майже він\nШукаю спілкування та прогулянки під місяцем\nНе проти?",
    location: Location(
        postcode: 69001,
        name: "Zaporizhzhia",
        id: 1,
        countryName: "Ukraine",
        longitude: 0.0,
        latitude: 0.0),
    photo: "assets/anna_shapovalova.PNG",
    interests: [
      Interest(1, 1, 'Graphic design', 'Art'),
      Interest(2, 1, 'True crime', 'Art'),
      Interest(3, 1, 'TV shows', 'Hobbies'),
      Interest(4, 1, 'Rock', 'Musics'),
    ]);
