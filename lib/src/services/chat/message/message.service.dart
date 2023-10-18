import 'package:amica/src/models/chat_message.dart';

abstract class MessageService {
  Future<List<ChatMessage>> getMessagesFor(String chatRoomId);
}
