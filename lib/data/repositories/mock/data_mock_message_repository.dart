import 'package:quite_simple_chat/domain/entities/message.dart';

import '../../../domain/repositories/message_repository.dart';

class DataMockMessageRepository extends MessageRepository {
  @override
  Future<List<Message>> getChatMessages({required String id}) async {
    List<Message> messages = [];
    if (id == "WAFn123hASF") {
      messages.add(
          Message(
              "4700124b883086ec6192c8d04632423b38d325f9a8e84c853340b7c79f258f7f",
            "WAFn123hASF",
            "hello",
            DateTime.now().subtract(Duration(minutes: 14)),
            "frederic",
          ),
      );
      messages.add(
        Message(
            "4700124b883086ec6192c8d04632423b38d325f9a8e84c853340b7c79f258f7f",
            "WAFn123hASF",
            "hello",
            DateTime.now().subtract(Duration(minutes: 14)),
            "you"
        ),
      );
    } else {
      messages.add(
        Message(
            "4700124b883086ec6192c8d04632423b38d325f9a8e84c853340b7c79f258f7f",
            "7a7e909500168585c7d92f67c5ff742d7026b1aa780b7b98ca14a6e4d330d7a3",
            "hello",
            DateTime.now().subtract(Duration(minutes: 14)),
            "you"
        ),
      );
    }
    return messages;
  }

}