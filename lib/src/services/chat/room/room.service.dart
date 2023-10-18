import 'package:amica/src/models/chat/chat_room.dart';

enum ChatRoomType { plain, pinned }

abstract class ChatRoomService {
  Future<List<ChatRoom>> getChatRoomsFor(
      String userId, ChatRoomType chatRoomType);
}
