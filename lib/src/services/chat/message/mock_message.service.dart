import 'package:amica/src/models/chat_message.dart';
import 'package:amica/src/services/chat/message/message.service.dart';
import 'package:flutter/services.dart';

class MockMessageService extends MessageService {
  static MockMessageService? _instance;

  static MockMessageService get instance {
    _instance ??= MockMessageService();

    return _instance!;
  }

  @override
  Future<List<ChatMessage>> getMessagesFor(String chatRoomId) async {
    String response =
        await rootBundle.loadString('assets/mock_chat_messages.json');

    return List.from(chatMessagesFromJson(response).where(
      (element) => element.chatroomId == int.parse(chatRoomId),
    ));
  }
}
