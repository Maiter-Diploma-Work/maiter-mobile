import 'package:maiter/src/models/shared/social_network.dart';

import '../models/profiles/user_profile.dart';
import '../models/shared/interest.dart';
import '../models/shared/location.dart';

final UserProfile ValeryDoe = UserProfile(
  id: 2,
  age: 22,
  tag: '@the-only-v',
  name: "Valery Doe",
  height: 1.75,
  gender: 'Female',
  birthDate: DateTime(2055, 1, 1),
  education: 'Unknown',
  description:
      "You could tell me what to say, you could tell where to go\nBut I doubt that I would care and my heart would never know",
  location: Location(
      postcode: "10000",
      name: "Night City",
      id: 1,
      countryName: "Night City",
      longitude: 0.0,
      latitude: 0.0),
  photo: "assets/the_v.jpg",
  interests: [
    Interest(
      id: 5,
      profileId: 2,
      name: 'Programing',
      category: 'Hobbies',
    ),
    Interest(
      id: 6,
      profileId: 2,
      name: 'True crime',
      category: 'Art',
    ),
    Interest(
      id: 7,
      profileId: 2,
      name: 'Music',
      category: 'Music',
    ),
    Interest(
      id: 8,
      profileId: 2,
      name: 'Rock',
      category: 'Musics',
    ),
    Interest(
      id: 9,
      profileId: 2,
      name: 'Valorant',
      category: 'Games',
    ),
    Interest(
      id: 10,
      profileId: 2,
      name: 'Dogs',
      category: 'Hobbies',
    ),
  ],
  socialNetworks: [
    SocialNetwork(id: 1, userId: 2, name: "Telegram", userName: "@theonlyv"),
    SocialNetwork(id: 1, userId: 2, name: "Instagram", userName: "@theonlyv"),
  ],
  favoriteSong: 'Nomico - Bad Apple',
);
