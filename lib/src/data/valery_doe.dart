import 'package:amica/src/models/profiles/character_trait.dart';
import 'package:amica/src/models/profiles/expectancies.dart';
import 'package:amica/src/models/shared/social_network.dart';

import '../models/profiles/user_profile.dart';
import '../models/shared/interest.dart';
import '../models/shared/location.dart';

final UserProfile ValeryDoe = UserProfile(
  id: 2,
  tag: '@the-only-v',
  name: "Valery Doe",
  height: 175,
  gender: 'Female',
  birthDate: DateTime(2050, 1, 1),
  education: 'Unknown',
  description:
      "You could tell me what to say, you could tell where to go\nBut I doubt that I would care and my heart would never know",
  location: Location(
    postcode: "10000",
    name: "Night City",
    id: 1,
    countryName: "Night City",
    longitude: 0.0,
    latitude: 0.0,
  ),
  status: 'Free',
  lookingFor: 'Anyone',
  photo: "assets/valery_doe.jpg",
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
  characterTraits: [
    CharacterTrait(
      id: 1,
      userId: 1,
      bottomName: 'Introvert',
      topName: 'Extravert',
      degree: 8,
    ),
    CharacterTrait(
      id: 2,
      userId: 1,
      bottomName: 'Analytic',
      topName: 'Creative',
      degree: 5,
    ),
    CharacterTrait(
      id: 3,
      userId: 1,
      bottomName: 'Busy',
      topName: 'Time rich',
      degree: 1,
    ),
    CharacterTrait(
      id: 5,
      userId: 1,
      bottomName: 'Messy',
      topName: 'Organized',
      degree: 5,
    ),
    CharacterTrait(
      id: 6,
      userId: 1,
      bottomName: 'Independent',
      topName: 'Team Player',
      degree: 5,
    ),
    CharacterTrait(
      id: 7,
      userId: 1,
      bottomName: 'Passive',
      topName: 'Active',
      degree: 5,
    ),
    CharacterTrait(
      id: 8,
      userId: 1,
      bottomName: 'Safe',
      topName: 'Risky',
      degree: 10,
    ),
  ],
  expectancies: [
    Expectancy(
      id: 1,
      userId: 1,
      text: 'Respect me and my time',
    ),
    Expectancy(
      id: 2,
      userId: 1,
      text: 'No separation anxiety',
    ),
    Expectancy(
      id: 3,
      userId: 1,
      text: 'Be quite',
    ),
    Expectancy(
      id: 4,
      userId: 1,
      text: 'Similar interests',
    ),
    Expectancy(
      id: 5,
      userId: 1,
      text: 'Adequate reaction to critisism',
    ),
  ],
);
