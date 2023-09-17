import 'package:amica/src/models/DTO/dislike_dto.dart';
import 'package:amica/src/models/DTO/like_dto.dart';

abstract class LikeService {
  Future<List<LikeDto>> getLikesForUser(int userId);

  Future<void> likeUser(LikeDto like);
  Future<void> dislikeUser(DislikeDto like);
}