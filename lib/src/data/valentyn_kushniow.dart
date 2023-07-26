import 'package:maiter/src/models/shared/social_network.dart';

import '../models/profiles/user_profile.dart';
import '../models/shared/interest.dart';
import '../models/shared/location.dart';

final UserProfile ValentynKushnirow = UserProfile(
  id: 2,
  age: 20,
  tag: '@lempurdysh',
  name: "Valentyn Kushnirow",
  gender: 'Male',
  birthDate: DateTime(2002, 12, 23),
  education: 'ItStep academy',
  description:
      "You could tell me what to say, you could tell where to go\nBut I doubt that I would care and my heart would never know",
  location: Location(
      postcode: "69001",
      name: "Zaporizhzhia",
      id: 1,
      countryName: "Ukraine",
      longitude: 0.0,
      latitude: 0.0),
  photo: "assets/valentyn_kushnirow.jpg",
  interests: [
    Interest(
      id: 5,
      profileId: 2,
      category: 'Programing',
      name: 'Hobbies',
    ),
    Interest(
      id: 6,
      profileId: 2,
      category: 'True crime',
      name: 'Art',
    ),
    Interest(
      id: 7,
      profileId: 2,
      category: 'Music',
      name: 'Hobbies',
    ),
    Interest(
      id: 8,
      profileId: 2,
      category: 'Rock',
      name: 'Musics',
    ),
    Interest(
      id: 9,
      profileId: 2,
      category: 'Valorant',
      name: 'Games',
    ),
    Interest(
      id: 10,
      profileId: 2,
      category: 'Dogs',
      name: 'Hobbies',
    ),
  ],
  socialNetworks: [
    SocialNetwork(id: 1, userId: 2, name: "Telegram", userName: "@lempurdysh"),
    SocialNetwork(id: 1, userId: 2, name: "Instagram", userName: "@lempurdysh"),
  ],
);
