import '../entities/message.dart';

abstract class MessageRepository {
  Future<List<Message>> getChatMessages({required String id});
}