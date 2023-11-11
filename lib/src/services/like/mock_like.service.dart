import 'package:amica/src/models/DTO/dislike_dto.dart';
import 'package:amica/src/models/DTO/like_dto.dart';
import 'package:amica/src/services/like/like.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MockLikeService extends LikeService {
  static LikeService? _instance;

  final List<LikeDto> _likesRepository = [];

  @override
  Future<List<LikeDto>> getLikesForUser(int userId) async {
    // ! I know this is the worst way possible.
    // ! The logic for this feature will be released on backend,
    // ! and this method will be nothing more than fetch call

    final String likesResponse =
        await rootBundle.loadString('assets/mock-data/mock_likes.json');

    List<LikeDto> likes = likesDtoFromJson(likesResponse);
    List<LikeDto> result = [];

    for (LikeDto like in likes) {
      if (like.firstUserId == userId) {
        result.add(like);
      }
    }

    return result;
  }

  static get instance {
    _instance ??= MockLikeService();

    return _instance;
  }

  @override
  Future<void> dislikeUser(DislikeDto like) async {}

  @override
  Future<void> likeUser(LikeDto like) async {}
}
